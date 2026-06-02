/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A {
    open func f1() {
        return 0
    }
    static func g1() {
        return 0
    }
    mut open prop a1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
    mut static prop b1: Int64 {
        get() {
            0
        }
        set(v) {
            v
        }
    }
}

main() {
    var a = A()
    return a.f1() + A.g1() + a.a1 + A.b1
}
// ASSERT: scan sema_ignore_open
// ASSERT: scan chir_dce_unused_variable
