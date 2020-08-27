import os
import numpy as np
import matplotlib.pyplot as plt

files = [np.load(i)[1:,:] for i in filter(lambda v: "batch" in v,os.listdir())]
sim = np.concatenate(files)

firing_PN = np.logical_and(sim[1:,:90]>0,sim[:-1,:90]<0)
firing_LN = np.logical_and(sim[1:,90:]>-20,sim[:-1,90:]<-20)

import neo
from quantities import ms,s
from tqdm import tqdm
from elephant.statistics import time_histogram

PNspikes= []
for i in tqdm(range(90)):
    spike_times = np.arange(2,6000)[firing_PN[:,i]]
    PNspikes.append(neo.SpikeTrain(spike_times*ms,t_start=0*ms,t_stop=6000*ms))
hists = []
for n,i in enumerate(PNspikes):
    histogram_rate = time_histogram([i], binsize=0.1*s,output='rate')
    hists.append(histogram_rate.magnitude.flatten())
hists = np.array(hists)
plt.subplot(121)
plt.eventplot([temp.magnitude for temp in PNspikes], color='black')
plt.subplot(122)
plt.imshow(hists,aspect='auto')
plt.colorbar()
plt.show()

resp = [(i.sum(axis=0)>0).mean() for i in np.array_split(firing_PN,6000/50,axis=0)]
resp2 = [(i.sum(axis=0)>0).mean() for i in np.array_split(firing_LN,6000/50,axis=0)]
plt.subplot(311)
plt.plot(hists.mean(axis=0))
plt.subplot(312)
plt.plot(resp)
plt.subplot(313)
plt.plot(resp2)
plt.show()

from neurodsp.filt import filter_signal
fs = 100
spikes = [i.sum() for i in np.array_split(firing_PN,6000/10,axis=0)]
pop = [i.sum() for i in np.array_split(sim[:,:90],6000/10,axis=0)]
spikes=np.array(spikes)
pop=np.array(pop)
spikes = (spikes-spikes[:100].mean())/spikes[:100].std()
pop = (pop-pop[:100].mean())/pop[:100].std()
plt.subplot(211)
plt.plot(spikes)
plt.plot(pop)
plt.subplot(212)
plt.plot(filter_signal(spikes, fs, 'bandpass', (15,30)))
plt.plot(filter_signal(pop, fs, 'bandpass', (15,30)))
plt.show()
