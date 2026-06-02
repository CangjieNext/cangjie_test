/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Data {
    public let a: Int32 = 1
    public static let b: Int32 = a
}

func run(): Int64 {
    var data: Data = Data()
    if (data.a != 1 || Data.b != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_static_variable_cannot_access_non_static_member
// ASSERT: scan sema_used_before_initialization
