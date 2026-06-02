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

class A {}

interface I {}

extend A <: I {}

var a = 0

open class B {
    protected open func foo(): I {
        a = a + 1
        return A()
    }
}

class C <: B {
    protected override func foo(): I {
        a = a + 2
        return A()
    }
}

main(): Int64 {
    var re1 = C().foo()
    var re2 = B().foo()
    if (re1 is A && re1 is I && re2 is A && re2 is I && a == 3) {
        return 0
    }

    return 2
}
