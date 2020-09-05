import os
import numpy as np
import matplotlib.pyplot as plt
import sys
import neo
from quantities import ms,s
from tqdm import tqdm
from elephant.statistics import time_histogram,instantaneous_rate
from elephant import kernels


folder = filter(os.path.isdir, os.listdir())
if len(sys.argv)>1:
    folder = filter(lambda v: sys.argv[1] in v, folder)

PNs = []
LNs = []
for dirs in tqdm(folder):
    files = [np.load(dirs+'/'+i)[1:,:] for i in filter(lambda v: "batch" in v,os.listdir(dirs))]
    sim = np.concatenate(files)
    firing_PN = np.logical_and(sim[1:,:90]>0,sim[:-1,:90]<0)
    firing_LN = np.logical_and(sim[1:,90:]>-20,sim[:-1,90:]<-20)
    PNs.append(firing_PN)
    LNs.append(firing_LN)

## Step 1  average psth/rate histograms
pn_fr = []
pn_count = []

for trial in tqdm(PNs):
    fr_trial = []
    count_trial = []
    for i in range(90):
        spk_times = np.arange(2,6000)[trial[:,i]]
        spk_train = neo.SpikeTrain(spk_times*ms,t_start=0*ms,t_stop=6000*ms)
        inst_rate = instantaneous_rate(spk_train, sampling_period=ms,kernel=kernels.AlphaKernel(sigma=100*ms))
        hist_rate = time_histogram([spk_train], binsize=50*ms,output='counts')
        fr_trial.append(inst_rate.magnitude.flatten())
        count_trial.append(hist_rate.magnitude.flatten())
    pn_fr.append(fr_trial)
    pn_count.append(count_trial)
pn_fr=np.array(pn_fr)
pn_count=np.array(pn_count)

print(pn_fr.shape)
print(pn_count.shape)

pn_pf = (pn_count>0).mean(axis=0)

fig1,ax1 = plt.subplots(2,1)
fig2,ax2 = plt.subplots(4,1)

g = ax1.flat[0].imshow(pn_fr.mean(axis=0),aspect='auto')
c = plt.colorbar(g,ax=ax1.flat[0])
ax1.flat[0].set_xlabel("Time (ms)")
ax1.flat[0].set_ylabel("PN")
c.set_label("Firing Rate (Hz, 0.1s exp)")


g = ax1.flat[1].imshow(pn_pf,aspect='auto')
c = plt.colorbar(g,ax=ax1.flat[1])
ax1.flat[1].set_xlabel("Time (ms)")
ax1.flat[1].set_ylabel("PN")
c.set_label("Firing Probability (Across Trial)")

ax2.flat[0].plot(pn_fr.mean(axis=0).mean(axis=0))
ax2.flat[0].set_xlabel("Time (ms)")
ax2.flat[0].set_ylabel("Firing Rate (Hz)")


ax2.flat[1].plot((pn_pf==0).mean(axis=0))
ax2.flat[1].set_xlabel("Time (100 ms)")
ax2.flat[1].set_ylabel("Silent PNs")

ax2.flat[2].plot((pn_pf>0.66).mean(axis=0))
ax2.flat[2].set_xlabel("Time (100 ms)")
ax2.flat[2].set_ylabel("Responsive PNs (>66%)")

ax2.flat[3].plot(np.logical_and(pn_pf<=0.66,pn_pf>0).mean(axis=0))
ax2.flat[3].set_xlabel("Time (100 ms)")
ax2.flat[3].set_ylabel("Unreliable PNs")

plt.tight_layout()
plt.show()






# PNspikes= []
#
#
#     PNspikes.append(neo.SpikeTrain(spike_times*ms,t_start=0*ms,t_stop=6000*ms))
#     hists = []
# for n,i in enumerate(PNspikes):
#     histogram_rate = time_histogram([i], binsize=0.1*s,output='rate')
#     hists.append(histogram_rate.magnitude.flatten())
# hists = np.array(hists)
# ax1.flat[0].eventplot([temp.magnitude for temp in PNspikes],color=colors[count],alpha=0.1)
# count+=1
# ax1.flat[1].imshow(hists,aspect='auto',alpha=0.1)
#
# resp = [(i.sum(axis=0)>0).mean() for i in np.array_split(firing_PN,6000/50,axis=0)]
# resp2 = [(i.sum(axis=0)>0).mean() for i in np.array_split(firing_LN,6000/50,axis=0)]
# ax2.flat[0].plot(hists.mean(axis=0))
# ax2.flat[1].plot(resp)
# ax2.flat[2].plot(resp2)
#
# ci = np.load(dirs+'/current_input.npy')[1:,:]
# for i in range(5):
#     ax3.flat[i].plot(ci[i,:500])
# plt.show()
