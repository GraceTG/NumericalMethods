# False Position
### General Description 
False position is a bracketing root finding method. This method uses two function values and creates a straight line between them, the point where this line intersects the x axis is the new estimated root. 
### Code Description 
The function, lower and upper guess for the root need to be initially inputed along with a stopping condition and max interations if the defualt ones are not desired. These values are inputed into the False Position Equation and the relative error is calculated to see if another iteration is needed to meet the stopping criteria. If another interation is needed the lower and upper roots are reset based on the results from the previous interation. This is done until the stopping criteria is met. Once complete the function, root, error and iterations will be displayed. 
