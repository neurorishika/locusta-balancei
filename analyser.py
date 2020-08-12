import os
import numpy as np
import matplotlib.pyplot as plt

files = [np.load(i)[1:,:] for i in filter(lambda v: "batch" in v,os.listdir())]
sim = np.concatenate(files)
plt.imshow(sim.T,aspect='auto')
plt.show()
