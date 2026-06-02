/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I1 {
    mut static prop a: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

interface I2 {
    mut static prop a: Int64 {
        get() {
            0
        }
        set(v) {}
    }
}

interface I3 <: I1 & I2 {}

main(): Int64 {
    return I3.a
}
// ASSERT: scan sema_interface_member_must_be_implemented
