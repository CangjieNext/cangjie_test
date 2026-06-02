/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

main(): Int64 {
    func test(): Int64 {
        var i: Int64 = 0
        func deep_test(): Int64 {
            return i
        }
        return deep_test()
    }
    func test2(): Int64 {
        return 0
    }
    return i // undeclared identifier i
}
// ASSERT: scan sema_undeclared_identifier
