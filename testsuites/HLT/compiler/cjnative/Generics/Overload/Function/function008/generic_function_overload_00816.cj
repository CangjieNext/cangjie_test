/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    var a: T
    func test(a: T) {
        return 1
    }
    func x(a: T) {
        func test(input: T) {
            return 2
        }
        var I = test(a)
        return I
    }
}

main(): Int64 {
    var I = A<Int32>.x(1)
    if (I != 2) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_illegal_access_non_static_member
