/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum E {
    | e
}

class A {
    public var e: Int64 = 1
    public static func test() {
        var a = e
    }
}

main(): Int64 {
    A.test()
    return 0
}
// ASSERT: scan sema_static_function_cannot_access_non_static_member
