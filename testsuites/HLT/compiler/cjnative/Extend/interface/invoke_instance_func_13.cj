/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

open class B {
    var c = 0

    func bbb() {
    }
}

class A <: B {
    public A(let b!: Int32 = 0) {
    }
}

interface I {
    func foo() {
        return 1
    }
}

extend A <: I {
    public func me() {
        super.c
        super.bbb()
        super.foo()
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_extend_use_super
