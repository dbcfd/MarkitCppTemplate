#pragma once

#include "module_a/Platform.h"

namespace markit
{
namespace module_a
{

class MODULE_A_API ClassA {
public:
	ClassA();
	~ClassA();
	
	bool functionReturningTrue(const int value);
};

}
}