/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    return run()
}

struct Data {
    static func area(): Int32 {
        return 2
    }
}

func run(): Int64 {
    var area: Int32 = Data().area()
    return 0
}
// ASSERT: scan sema_object_cannot_access_static_member
