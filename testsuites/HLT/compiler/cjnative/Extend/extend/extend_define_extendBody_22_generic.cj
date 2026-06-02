/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f -o %output

class A<T> {
    public var a = 0
    public func foo1() {
        return 0
    }
}

extend<T> A<T> {
    public static func foo1(a: Int32) {
        return a
    }
}

main(): Int64 {
    return 5
}
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
