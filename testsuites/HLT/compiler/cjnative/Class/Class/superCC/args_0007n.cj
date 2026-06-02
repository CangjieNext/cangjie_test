/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

var a = 0

open class C1<T> {
    public open func f(b: Bool) {
        a = 3
    }
}

class C2 <: C1<Bool> {
    public override func f(b: Bool) {
        super.f(b)
    }
}

main(): Int64 {
    C2<Rune>().f(true)
    return (a - 3)
}
// ASSERT: scan sema_generic_argument_no_match
