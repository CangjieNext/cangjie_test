// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {}

struct B {}

enum C {
    D
}

struct E {}

extend E <: Any {} // EXPECTED: regex 'Any' interface is not able to be extended

class F {}

extend F <: Any {} // EXPECTED: regex 'Any' interface is not able to be extended

class G <: Any {} // ok

class H {} // Implicit implement Any

extend H <: Any {} // error

main() {
    var i: Any = A() // ok
    i = B() // ok
    i = C.D // ok
    i = (1, 2) // ok
    i = {=> 123} // ok
    return 0
}
