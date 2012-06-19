#pragma once

#include <stdexcept>

#pragma warning(disable:4251)
#pragma warning(disable:4275)
//windows defines
#if defined(MODULE_A_BUILD)
#define MODULE_A_API __declspec(dllexport)
#else
#define MODULE_A_API __declspec(dllimport)
#endif