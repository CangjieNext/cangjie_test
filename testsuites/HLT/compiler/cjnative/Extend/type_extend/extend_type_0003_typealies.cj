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

class C {
    static func foo(a: TI) {
        a
    }
}

main(): Int64 {
    if (C.foo(TA()) is TI && C.foo(TA()) is TA) {
        return 0
    }
    return 2
}
