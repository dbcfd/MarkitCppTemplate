#pragma once

#include "module_b/Platform.h"

namespace markit
{
namespace module_b
{

class MODULE_B_API ClassB
public:
	ClassB();
	~ClassB();
	
	bool functionReturningTrue(const int value);
};

}
}