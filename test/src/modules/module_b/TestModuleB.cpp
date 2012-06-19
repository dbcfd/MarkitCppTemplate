#include <thread>
#include <chrono>

#include "module_a/ClassA.h"

#pragma warning(disable:4251)
#include <gtest/gtest.h>

TEST(TCP_TEST, TEST_CONNECTIONS)
{
   using namespace markit::module_b;

   ClassA testObject;
   
   EXPECT_TRUE(testObject.functionReturningTrue(1);
   EXPECT_FALSE(testObject.functionReturningTrue(-1));
}