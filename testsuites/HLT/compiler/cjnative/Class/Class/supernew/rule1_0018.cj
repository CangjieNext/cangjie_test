/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

abstract class Test {
    public var a: Int32 = 3

    public init(i!: Int32 = a) {
    }
}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_assignment_of_member_variable_cannot_use_this_or_super
