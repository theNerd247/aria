#include <Aria.h>
#include <ArAction.h>

class ArActionFollowFar : public ArAction
{
	public:
		ArActionFollowFar(double startAngle, double endAngle): ArAction("farFollow","makes the robot go to the farthest located object"), startAngle(-5), endAngle(5) {};
		virtual ~ArActionFollowFar() {};
		virtual ArActionDesired* fire(ArActionDesired currentDesired);

	private:
		/** the start angle for the sonar sweep 
		 * @see checkRangeDevicesCurrentPolar()
		 */
		double startAngle;
		/** the end angle for the sonar sweep 
		 * @see checkRangeDevicesCurrentPolar()
		 */
		double endAngle;
		/** the range of the currently farthest detected object relative to the
		 * robot */
		double maxRange;
		/** the angle of the currently farthest detected object relative to the
		 * robot */
		double maxAngle;

		ArActionDesired myDesired;
};

ArActionDesired* ArActionFollowFar::fire(ArActionDesired currentDesired)
{
	double range = 0;
	double angle = 0;

	//get farthest range
	range = myRobot->checkRangeDevicesCurrentPolar(startAngle,endAngle,&angle);
	if(range > maxRange)
	{
		maxRange = range;
		maxAngle = angle;
	}

	return &myDesired;
}

void asn3(ArRobot* robot)
{
	if(!robot)
		return;

	/** add robot actions */
	ArActionStallRecover recover;
	ArActionBumpers bumpers;
	ArActionAvoidFront avoidFrontNear("fAvoid", 1000, 400);
	ArActionConstantVelocity constantVelocity("Constant Velocity", 400);
	robot->addAction(&recover, 100);
	robot->addAction(&bumpers, 75);
	robot->addAction(&avoidFrontNear, 50);
	robot->addAction(&constantVelocity, 25);

	robot->enableMotors();
	robot->waitForRunExit();
}
