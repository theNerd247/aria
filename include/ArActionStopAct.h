#include <Aria.h>
#include <ArAction.h>

class ArActionStopAct : public ArAction
{
	public:
		ArActionStopAct() : ArAction("arStop","monitors robot travel") {};
		virtual ~ArActionStopAct() {};

		virtual ArActionDesired* fire(ArActionDesired);
	
	private:
		ArActionDesired myDesired;
		ArPose initPos, currPos;
};
