#include <Aria.h>
#include <ArAction.h>

#include "ArActionWallFollow.h"
#include "ArActionStopAct.h"

void asn5(ArRobot* robot)
{
	if(!robot)
		return;

	/** add robot actions */
	ArActionGoto goThere;
	goThere.setCloseDist(1);
	ArActionWallFollow wallFollow(ArActionWallFollow::leftSide,10,true,1000);

	robot->addAction(&goThere,50);
	robot->addAction(&wallFollow,50);

	robot->enableMotors();
	goThere.setGoal(ArPose(7000,4000));

	robot->waitForRunExit();
}
