#include "Aria.h"
#include <stdio.h>

extern void ASNxHEADER;

int main(int argc, char *argv[])
{
	Aria::init(); // initialize Aria

	ArArgumentParser argParser(&argc, argv); // deal with the command line parameters
	argParser.loadDefaultArguments();

	ArRobot robot("blarg"); // create the robot object
	ArRobotConnector robotConnector(&argParser, &robot); // create the connector
	if(!robotConnector.connectRobot())  // connect to the robot
	{
	  ArLog::log(ArLog::Terse, "Could not connect to the robot.");
	}

	ArSonarDevice sonar; //create the sonar object and add it to the robot
	robot.addRangeDevice(&sonar);

	/** wait for devices to configure */
	//ArUtil::sleep(1000);
	
	/** run robot control loop in a seperate thread */
	robot.runAsync(true); 

  //run asssignment
	RUNASNx;

	/* Shutdown Aria and exit */
	Aria::shutdown();
	Aria::exit(0);
	return 0;
}
