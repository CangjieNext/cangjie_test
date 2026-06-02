/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

struct Test {
    public let a: Int32 = 1
    public var b: Int32 = 2
    public Test(a1: Int32) {
        a = a1
        return 0
    }
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_cannot_convert_literal
