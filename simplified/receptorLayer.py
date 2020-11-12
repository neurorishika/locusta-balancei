import numpy as np
import matplotlib.pyplot as plt
import polarTools as pt
import pickle
import sys

print("Welcome to the ORNs !!!")

# Select the Odorant, Odor Delivery Protocol, Locust Model
odor_path = sys.argv[1]
protocol_path = sys.argv[2]
locust_path = sys.argv[3]

# Load the Odorant, Odor Delivery Protocol, Locust Model
with open(odor_path, 'rb') as fp:
    odor = pickle.load(fp)
with open(protocol_path, 'rb') as fp:
    protocol = pickle.load(fp)
with open(locust_path, 'rb') as fp:
    locust = pickle.load(fp)

locust['peak_firing'] = 0.70*locust['peak_firing']

# Define ORN Response Generator
def generate_orn(orn_number,duration,resolution,odorVec,odorStart,odorEnd): # Function to generate single ORN Trace
    np.random.seed(int(locust['rec_seeds'][orn_number]))
    baseline = np.clip(locust['baseline_firing']+8.75+0.2*locust['baseline_firing_variation']*np.random.normal(),1,None)/locust['peak_firing'] # Baseline Firing Rate Ratio
    trace = baseline*np.ones(int(duration/resolution)) # Set Baseline activity for the Protocol Duration
    np.random.seed()
    rec_field = pt.generateUniform(1,odor['dim_odorspace'],seed=int(locust['rec_seeds'][orn_number])) # Receptive Field of ORNs in Odor Space

    latency = locust['latency'][orn_number] # Latency of Response to Odor Presentation
    t_rise = locust['t_rise'][orn_number] # Time to Rise to Peak
    t_fall = locust['t_fall'][orn_number] # Response Decay Time
    tuning = np.int32(locust['tuning'][orn_number]*3) # Odor Tuning-width / Sensitivity

    def sigmoid(x,a1=locust['a1'],a2=locust['a2']):	# Sigmoid for Response
        return 1/(1+np.exp(-a1*(x-a2)))

    def tanc(x, a=0.06083939,b=0.16323569,c=1.73986923,d=0.34085669):
        return a+b*np.tan(c*x-d)

    odorMag = np.linalg.norm(odorVec) # Odor Concentration
    cosSim = np.dot(odorVec,rec_field)/(np.linalg.norm(odorVec)*np.linalg.norm(rec_field)) # Cosine Similarity wrt Odor

    if np.arccos(cosSim) < np.deg2rad(locust['inh_threshold']):	# Minimum Response Threshhold
        res_strength = (1-baseline)*tanc(odorMag*np.cos(np.arccos(cosSim)/2)**tuning)
    else:
        res_strength = -baseline*odorMag

    if locust['f_sharp'][orn_number]:
        # Generate Sharp Trace
        rise = np.arange(0,t_rise/2,resolution)
        rise = baseline+res_strength*2*np.exp(1)/t_rise*rise*np.exp(-2*rise/t_rise)
        riseStartIndex = int((odorStart+latency)/resolution)
        riseEndIndex = riseStartIndex+rise.shape[0]
        trace[riseStartIndex:riseEndIndex] = rise
        peak = rise[-1]
        fall = np.linspace(0,duration-riseEndIndex*resolution,trace.shape[0]-riseEndIndex)
        fall = (peak-baseline)*np.exp(-fall/t_fall)+baseline
        fallStartIndex = riseEndIndex
        trace[fallStartIndex:] = fall
    else:
        # Generate Broad Trace
        rise = np.arange(0,t_rise,resolution)
        rise = baseline+res_strength*np.exp(1)/t_rise*rise*np.exp(-rise/t_rise)
        riseStartIndex = int((odorStart+latency)/resolution)
        riseEndIndex = int((odorStart+latency)/resolution)+rise.shape[0]
        trace[riseStartIndex:riseEndIndex] = rise
        peak_1 = rise[-1]
        adaptation_rate = locust['adaptation_extent'][orn_number] # Amplitude of Adaptation-related Decay
        t_adaptation = locust['t_adaptation'][orn_number] # Odor Adaptation Time
        adaptation = np.arange(0,(int(odorEnd/resolution)-riseEndIndex)*resolution,resolution)
        adaptation = (peak_1-(adaptation_rate*res_strength+baseline))*np.exp(-adaptation/t_adaptation)+(adaptation_rate*res_strength+baseline)
        adaptationStartIndex = riseEndIndex
        adaptationEndIndex = adaptationStartIndex+adaptation.shape[0]
        trace[adaptationStartIndex:adaptationEndIndex] = adaptation
        peak_2 = adaptation[-1]
        fall = np.arange(0,(trace.shape[0]-adaptationEndIndex)*resolution,resolution)
        fall = (peak_2-baseline)*np.exp(-fall/t_fall) + baseline
        fallStartIndex = adaptationEndIndex
        trace[fallStartIndex:] = fall

    trace = trace*locust['peak_firing'] # Scale to Peak Firing Rate

    return trace

# Generate Odor Response

print("Generating ORN Responses...")

orns = []
for i in range(locust['ORN_types']): # Generate ORN types
    orns.append(generate_orn(i,protocol['duration'],protocol['resolution'],odor['odor_vector'],protocol['odor_start'],protocol['odor_start']+protocol['odor_duration']))
    print('{}/{} ORN Types Completed'.format(i+1,locust['ORN_types']), end = '\r')

orns = np.array(orns*locust['ORN_replicates'])


print("Generation Complete.")

# Save ORN Data
np.save(sys.argv[4]+'/ORN Firing Data',orns[:,::100])

X = np.zeros((locust['AL_n'],orns.shape[1]))

for i in range(locust['AL_n']):
    X[i,:] = orns.mean(axis=0)-orns[:,:int(protocol['odor_start']/protocol['resolution'])].mean()

#X = (1+0.2*np.sin(2*np.pi*20/1000*protocol['resolution']*np.arange(X.shape[1])))*X

np.random.seed(int(sys.argv[5]))
A_numbers = np.random.choice(np.arange(90,120),size=6,replace=False)
X[A_numbers,int((protocol['odor_start']+500)/protocol['resolution']):int((protocol['odor_start']+700)/protocol['resolution'])] = 1.5*X[A_numbers,int((protocol['odor_start']+500)/protocol['resolution']):int((protocol['odor_start']+700)/protocol['resolution'])]

print("Generation Complete")

# Save Current Input
np.save(sys.argv[4]+'/current_input',X)

print("'Information has been transferred to the Antennal Lobe. Thank you for using our services.' - ORNs")
