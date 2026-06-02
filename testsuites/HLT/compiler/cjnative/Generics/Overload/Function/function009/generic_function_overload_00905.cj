/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A<T> {
    public func test(a: T) {
        return 1
    }
    public func test(a: T, b!: Int64 = 1) {
        return 2
    }
}

class B<T> <: A<T> {
    public var a: T
    public func i() {
        var I = super.test(a)
        return I
    }
}

main(): Int64 {
    var I = B<Int64>(1).i()
    return 0
}
// ASSERT: scan sema_class_uninitialized_field
// ASSERT: scan sema_ambiguous_match
// ASSERT: scan sema_wrong_number_of_arguments
