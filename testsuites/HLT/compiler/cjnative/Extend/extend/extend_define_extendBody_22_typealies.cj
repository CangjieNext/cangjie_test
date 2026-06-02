/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

class A {
    public var a = 0
    public func foo1() {
        return 0
    }
}

type C = A

extend C {
    public static func foo1(a: Int32) {
        return a
    }
}

main(): Int64 {
    return 5
}
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
