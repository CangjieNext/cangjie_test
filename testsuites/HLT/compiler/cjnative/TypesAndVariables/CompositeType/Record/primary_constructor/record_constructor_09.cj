/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: regex-auto constructor is called

struct Test {
    public let a: Int32 = 1
    public let b: Int32 = 2
    public Test() {
        print("constructor is called")
    }
}

main(): Int64 {
    let res = Test()
    return 0
}
