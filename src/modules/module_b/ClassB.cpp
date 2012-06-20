#include "module_b/ClassB.h"

namespace markit
{
namespace module_b
{

ClassB::ClassB()
{

}

ClassB::~ClassB()
{

}

bool ClassB::functionReturningTrue(const int value)
{
	bool ret = true;
	if(value < 0)
	{
		ret = false;
	}
	return ret;
}

}
}