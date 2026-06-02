// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: %n.lib.cj
// EXEC: %compiler %n.lib.cj %compile_lib_opt -o liba.%middle
// EXEC: %compiler %f liba.%middle

import a.*

class A <: I {
    public func foo() {
        1
    }
}

func foo<T>(value: T) where T <: I {
    value.foo()
}

main() {
    foo<A>(A())
}
