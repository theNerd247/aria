/**
 * @file ArActionWallFollow.h 
 *
 * AriaRobot Action class to follow a specified wall (either on right or left
 * side of robot)
 *
 * @author Noah Harvey (nharvey@spsu.edu)
 * @copyright GNU Public License 2
 */

#include <Aria.h>
#include <ArAction.h>

#include "ArActionWallFollow.h"

ArActionDesired* ArActionWallFollow::fire(ArActionDesired cDesired)
{
	myDesired.reset();

	/** get sonar data */
	range = myRobot->checkRangeDevicesCurrentPolar(-179,179,&angle);
		
			
	/* get which side we're on */
	if(angle < 0)
		fside = rightSide;
	else
		fside = leftSide;

	/** set the new heading based on the distance from nearest object */
	if(deprange)
		dangle = angle + (2*fside-1)*90*(dist/range);
	else
		dangle = angle + (2*fside-1)*90;

	//stop if no walls on side
	if(myRobot->checkRangeDevicesCurrentPolar(-90,90) > 2*dist)
	{
		nowall = true;
	}
	else
	{
		nowall = false;
		if(fabs(dangle) > delta)
		{
			//set the desired rotational velocity
			myDesired.setRotVel(fabs(dangle*.125));
			myDesired.setDeltaHeading(dangle);
		}
		else
			myDesired.setRotVel(0);
	}
	
	//ArLog::log(ArLog::Normal,"%f %f %f",range,dangle*range/200,dangle);

	return &myDesired;
}
