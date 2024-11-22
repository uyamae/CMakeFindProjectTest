#include "test_depending/test_depending.h"
#include "test_private.h"
#include "test_interface/test_interface.h"
#include <iostream>

namespace test_depending {

    struct S {
        int a;
    };

    inline int operator+ (const S & a, const S & b) {
        return a.a + b.a;
    }

    void TestDepending::Func()
    {
        TestDependingFunc();

        S a{ 1 };
        S b{ 2 };
        std::cout << test_interface::Add(a, b) << std::endl;
    }
}
