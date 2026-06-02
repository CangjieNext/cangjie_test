/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct A {
    public var i1: Int64 = 0
    public mut prop i2: Int64 {
        get() {
            return i1
        }
        set(value) {
            i1 = value
        }
    }
}

main() {
    let x = A()
    x.i1 = 1
    x.i2 = 2
    return 0
}
// ASSERT: scan sema_cannot_assign_to_immutable
