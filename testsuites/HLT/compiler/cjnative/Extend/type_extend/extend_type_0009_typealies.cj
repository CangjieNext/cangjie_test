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

type TI = I

type TA = A

extend TA <: TI {}

var a = 0

type TB = B

type TC = C

open class B {
    protected open func foo(): TI {
        a = a + 1
        return A()
    }
}

class C <: B {
    protected override func foo(): TI {
        a = a + 2
        return A()
    }
}

main(): Int64 {
    var re1 = TC().foo()
    var re2 = TB().foo()
    if (re1 is TA && re1 is TI && re2 is TA && re2 is TI && a == 3) {
        return 0
    }

    return 2
}
