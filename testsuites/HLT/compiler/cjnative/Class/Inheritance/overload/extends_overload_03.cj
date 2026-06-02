/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class Base {
    public func foo() {
        return 1
    }
}

open class Base1 <: Base {
    public func foo1(a: Int64) {
        return a
    }
}

class Data <: Base1 {
    public func foo2(a: Int64, b: Int64) {
        return a + b
    }
}

main(): Int64 {
    var obj1 = Base()
    var obj2 = Base1()
    var obj3 = Data()

    var res1: Int64 = obj1.foo()
    var res2: Int64 = obj2.foo1(2)
    var res3: Int64 = obj3.foo2(1, 2)

    if (res1 != 1 || res2 != 2 || res3 != 3) {
        return 1
    }
    return 0
}
