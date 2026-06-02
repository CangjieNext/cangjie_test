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
    static func test1(): Int64
}

interface I2 <: I1 {
    static func test2(): Int64 {
        test1()
    }
}

main(): Int64 {
    return I2.test2()
}
// ASSERT: scan sema_interface_call_with_unimplemented_call
