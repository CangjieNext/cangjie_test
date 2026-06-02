/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

abstract class R {
    var c: Int32 = 0
    public open func a(): Int32 {
        c = 10
        return 1
    }
}

open class C <: R {
    let b: () -> Int32
    init() {
        b = {=> 3}
        b = super.a
    }
}

var a = C().b

main(): Int64 {
    var c = a()
    return Int64(c - 1)
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_illegal_member_used_in_open_constructor
