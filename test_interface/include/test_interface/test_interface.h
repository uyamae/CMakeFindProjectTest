#pragma once

namespace test_interface {
    template<class T>
    inline auto Add(T a, T b) -> decltype(a + b) {
        return a + b;
    }
}
