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

open class C1<T> {
    public open func f(b: T) {
        a = 3
    }
}

class C2<T> <: C1<T> {
    public override func f(b: T) {
        super.f(b)
    }
}

main(): Int64 {
    C2<Bool>().f(true)
    return (a - 3)
}
