#include "test_private.h"
#include <iostream>

#include "test_static/test_static.h"

namespace test_depending {

    void TestDependingFunc()
    {
        std::cout << "test_depending::TestDependingFunc()" << std::endl;
        test_static::TestStatic ts;
        ts.Func();
    }
}