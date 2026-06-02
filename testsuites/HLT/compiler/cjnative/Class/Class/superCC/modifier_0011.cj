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

var a = 0

open class C1 {
    public open func f() {
        a = 3
    }
}

abstract class C2 <: C1 {
    public override func f() {
        super.f()
    }
}

class C3 <: C2 {}

main(): Int64 {
    C3().f()
    return (a - 3)
}
