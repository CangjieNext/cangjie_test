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
    static func test(): Int64 {
        return 0
    }
}

interface I2 {
    static func test(): Int64 {
        return 1
    }
}

interface I3 <: I1 & I2 {}

main(): Int64 {
    return I3.test()
}
// ASSERT: scan sema_interface_member_must_be_implemented
