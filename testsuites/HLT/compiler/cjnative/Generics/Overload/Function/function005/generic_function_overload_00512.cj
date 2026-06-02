/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class I<T> {
    public func test(a: T) {
        return 1
    }
    public func test(a: Int64) {
        return 2
    }
}

open class A<T> <: I<T> {
    public func test(a: Int32) {
        return 3
    }
}

class B<T> <: A<T> {
    public func test(a: Int16) {
        return 4
    }
    public var i: T
    public init(input: T) {
        i = input
    }
    public func a() {
        var I = super.test(i)
        return I
    }
}

main(): Int64 {
    var res1 = B<Int16>(1).a()
    var res2 = B<Int32>(1).a()
    var res3 = B<Int64>(1).a()
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
