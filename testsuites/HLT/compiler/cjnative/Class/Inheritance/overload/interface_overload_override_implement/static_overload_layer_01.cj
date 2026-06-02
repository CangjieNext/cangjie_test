/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

interface Base {
    func foo(): Int64
}

interface Base1 <: Base {
    func foo(): Int64
}

interface Base2 <: Base1 {
    func foo(): Int64
}

interface Base3 <: Base1 {
    func foo(): Int64
}

interface Data <: Base3 {
    func foo() {
        return 1
    }

    func foo(a: Int64) {
        return a
    }

    func insede() {
        super.foo()
    }
}

class Test <: Data {}

main(): Int64 {
    var res1: Int64 = Test().foo()
    var res2: Int64 = Test().foo(2)
    if (res1 != 1 || res2 != 2) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_use_super_in_interface
