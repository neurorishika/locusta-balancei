import os
import numpy as np
import matplotlib.pyplot as plt
import sys
import neo
from quantities import ms,s
from tqdm import tqdm
from elephant.statistics import time_histogram


folder = filter(os.path.isdir, os.listdir())
if len(sys.argv)>1:
    folder = filter(lambda v: sys.argv[1] in v, folder)


fig1,ax1 = plt.subplots(1,2)
fig2,ax2 = plt.subplots(3,1)
fig3,ax3 = plt.subplots(5,1)

colors = plt.cm.rainbow(np.linspace(0,1,9))
count=0
for dirs in folder:
    files = [np.load(dirs+'/'+i)[1:,:] for i in filter(lambda v: "batch" in v,os.listdir(dirs))]
    sim = np.concatenate(files)
    print(dirs)
    firing_PN = np.logical_and(sim[1:,:90]>0,sim[:-1,:90]<0)
    firing_LN = np.logical_and(sim[1:,90:]>-20,sim[:-1,90:]<-20)


    PNspikes= []
    for i in tqdm(range(90)):
        spike_times = np.arange(2,6000)[firing_PN[:,i]]
        PNspikes.append(neo.SpikeTrain(spike_times*ms,t_start=0*ms,t_stop=6000*ms))
        hists = []
    for n,i in enumerate(PNspikes):
        histogram_rate = time_histogram([i], binsize=0.1*s,output='rate')
        hists.append(histogram_rate.magnitude.flatten())
    hists = np.array(hists)
    ax1[0].eventplot([temp.magnitude for temp in PNspikes],color=colors[count],alpha=0.1)
    count+=1
    ax1[1].imshow(hists,aspect='auto',alpha=0.1)

    resp = [(i.sum(axis=0)>0).mean() for i in np.array_split(firing_PN,6000/50,axis=0)]
    resp2 = [(i.sum(axis=0)>0).mean() for i in np.array_split(firing_LN,6000/50,axis=0)]
    ax2[0].plot(hists.mean(axis=0))
    ax2[1].plot(resp)
    ax2[2].plot(resp2)

    ci = np.load(dirs+'/current_input.npy')[1:,:]
    for i in range(5):
        ax3[i].plot(ci[i,:500])
plt.show()
