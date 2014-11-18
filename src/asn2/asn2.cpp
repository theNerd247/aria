#include "Aria.h"
#include <stdio.h>

/**
 * @brief control func for asn2
 * 
 * call this function in main
 *
 * @return void
 * 
 */
void asn2(ArRobot* robot)
{
	if(!robot)
		return;
	double range,angle;

	ArUtil::sleep(1000);

	while(1)
	{
		/** get sonar range infront of robot */
		range = robot->checkRangeDevicesCurrentPolar(-90,90,&angle);
		ArLog::log(ArLog::Normal,"range: %f angle: %f",range,angle);
		ArUtil::sleep(100);
	}
}
