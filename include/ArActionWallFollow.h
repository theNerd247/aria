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

//TODO: add code to follow a wall given a distance from it
class ArActionWallFollow : public ArAction
{
	public:
		typedef enum 
		{ 
			leftSide,
			rightSide 
		} FollowSide;

		ArActionWallFollow(FollowSide side = leftSide, double dta = 5, bool frange = false, double drange = 700) : 
			ArAction("folloWall","ArAction to orient towards a wall"), 
			nowall(false),
			fside(side), 
			deprange(frange),
			dist(drange),
			delta(dta)
		{};

		virtual ~ArActionWallFollow() {};

		virtual ArActionDesired* fire(ArActionDesired);

		bool nowall;

	private:
		FollowSide fside;
		ArActionDesired myDesired;
		bool deprange;
		double range,dist,angle,dangle,delta;
};
