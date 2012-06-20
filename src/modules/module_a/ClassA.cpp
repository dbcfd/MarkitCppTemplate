#include "module_a/ClassA.h"

namespace markit
{
namespace module_a
{

ClassA::ClassA()
{

}

ClassA::~ClassA()
{

}

bool ClassA::functionReturningTrue(const int value)
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