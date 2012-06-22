#include "module_b/ClassB.h"

#pragma warning(disable:4251)
#include <gtest/gtest.h>

TEST(MODULEA_TEST, TEST_SIMPLE_FUNCTION)
{
   using namespace markit::module_b;

   ClassB testObject;
   
   EXPECT_TRUE(testObject.functionReturningTrue(1));
   EXPECT_FALSE(testObject.functionReturningTrue(-1));
}