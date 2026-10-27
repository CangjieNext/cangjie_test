// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

// A conditional extension whose condition cannot be decided statically for a generic subclass must
// be kept with a runtime condition instead of being dropped: the subclass still needs the interface
// slots contributed by its generic ancestor's extension, and conformance is decided at runtime.

interface I1 {
    func foo(): Int64 {
        1
    }
}

interface I2 {}

interface I3 {}

open class A<T> {
    public open func foo(): Int64 {
        100
    }
}

extend<T> A<T> <: I1 where T <: I2 {}

class B<U> <: A<U> where U <: I3 {
    public override func foo(): Int64 {
        200
    }
}

class Both <: I2 & I3 {}

class OnlyI3 <: I3 {}

func dispatch<U>(value: B<U>): Int64 where U <: I3 {
    if (value is I1) {
        (value as I1).getOrThrow().foo()
    } else {
        -1
    }
}

main() {
    // Both satisfies U <: I2 at runtime, so dispatch must reach the override B.foo, which is 200.
    if (dispatch<Both>(B<Both>()) != 200) {
        return 1
    }
    // OnlyI3 does not satisfy U <: I2, so B<OnlyI3> does not conform to I1.
    if (dispatch<OnlyI3>(B<OnlyI3>()) != -1) {
        return 2
    }
    return 0
}
