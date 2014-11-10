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

		//if(angle > 0) 
		//{
			//eA -= 1; 
			//sA -= 1;
		//}
		//else
		//{
			//eA += 1;
			//sA += 1;
		//}
	
		/** log the range and angle*/
		//sprintf(logbuff,"sA: %f, eA: %f angle: %f dist: %f",sA,eA,angle,range);
		//ArLog::log(ArLog::Normal,logbuff);
		ArLog::log(ArLog::Normal,"range: %f angle: %f",range,angle);
		ArUtil::sleep(100);
	}
}

