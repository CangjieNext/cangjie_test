/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    var a: A = A()
    return 0
}

open class A {
    public mut open prop m: Int64 {
        get() {
            return 0
        }
        set(v) {}
    }
    public open prop n: Int64 {
        get() {
            return 1
        }
    }
    public init() {
        var b = m
        var c = n
    }
}
// ASSERT: scan sema_illegal_member_used_in_open_constructor
