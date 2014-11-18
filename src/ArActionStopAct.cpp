#include <Aria.h>
#include <ArAction.h>

#include "ArActionStopAct.h"

ArActionDesired* ArActionStopAct::fire(ArActionDesired foo)
{

	currPos = myRobot->getPose();
	ArLog::log(ArLog::Normal,"%f %f %f",currPos.getX(),currPos.getY(),currPos.getTh());

	return &myDesired;
}
