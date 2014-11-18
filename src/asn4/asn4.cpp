#include <Aria.h>
#include <ArAction.h>

#include "ArActionWallFollow.h"
#include "ArActionStopAct.h"

void asn4(ArRobot* robot)
{
	if(!robot)
		return;

	/** add robot actions */
	ArActionWallFollow wallFollow(ArActionWallFollow::leftSide,0.2);
	ArActionConstantVelocity constantVelocity("Constant Velocity", 400);

	robot->addAction(&wallFollow,50);
	robot->addAction(&constantVelocity,49);

	robot->enableMotors();

	while(wallFollow.nowall == false);
}
