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
    public func test(a: Int64) {
        return 1
    }
    public func test(a: T) {
        return 2
    }
}

class B<T> <: A<T> {
    public var a: T
    public init(input: T) {
        a = input
    }

    public func test(a: Int32) {
        return 3
    }
    public func i() {
        var j = this.test(a)
        return j
    }
}

main(): Int64 {
    var res1 = B<Int32>(1).i()
    var res2 = B<Int64>(1).i()
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
