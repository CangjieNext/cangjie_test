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
    public let a: Int32
    public let b: Int32
    public init() {
        a = 3
        b = 4
    }
}

let res = Test(5)
// ASSERT: scan sema_wrong_number_of_arguments
