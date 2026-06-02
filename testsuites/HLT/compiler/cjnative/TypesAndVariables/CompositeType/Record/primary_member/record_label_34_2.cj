/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Test {
    public func foo(): Int32 {
        return 1
    }
    public let b: () -> Int32 = foo
}

func run(): Int64 {
    let res = Test().b
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_illegal_usage_of_member
