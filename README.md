Hodgkin-Huxley Lab

Model requires: alphah.m, alpham.m, alphan.m, betah.m, betam.m, betan.m, HH.m, in_HH.m, in_mhnv.m, izero.m, snew.m

Instructions: To complete this assignment you must do 2 things. 
1)Answer the questions below in a Word document. Generate plots/measurements as necessary to explain your findings

2)Commit your code changes for each step and push to Github classroom. 
a.Clone the repository from the Github classroom.
b.For each task make sure to commit both changes to the provided code as well as any scripts you generate. Also add figures associated with your findings to the repo as .jpg or .png files.


Task 1: Describe the following files
•Describe in words what the alpha files calculate
•Describe in words what the beta files calculate


Task 2: Check whether decreasing the time step changes the results.


Task 3: Explore threshold of activation. First, turn off the 2nd current pulse. Then, with vhold=-70, change vstart (in steps) and show the impact of different vstart with plots. Make sure your axis (if plotted separately) are the same.


Task 4: Consider your stimulus as vstart – vhold and size of response as being the maximum deviation of membrane potential from rest. Plot the relationship between stimulus and response. How does it change below/above the threshold value.


Task 4: Explore the impact of hyperpolarizing shocks. What is the stimulus vs response relationship. Explain how this generates action potentials.


Task 5: Modify the code so that the neuron is clamped at a different voltage prior to t. Then explore the effect of removing the voltage clamp (with no current shock). For a range of values, how does this compare to earlier stimulus vs. response relationship
 
Task 6: Restore izero to initial versions. Use t1p, t2p, and ip to control timing and strength of a second stimulus. For 1 ms pulse durations, how does the strength of the pulse needed for a depolarization vary as t1p increases (pulse occurs later in time).


Task 7: For a pulse at a given time (outside of the absolute refractory period), how does the duration of the pulse impact the current necessary.


Task 8: Modify izero to generate a constant current and result in periodic action potentials. Plot the frequency of action potentials as a function of the applied current. 


Task 9: What is the range of frequencies that the Hodgkin-Huxley neuron can generate?


Task 10: Using the Traub neuron code, explore how this range of frequencies changes given the subtle changes to the code. 


Task 11: Which neuron would you rather have encode a signal (like pressure on your skin)?
