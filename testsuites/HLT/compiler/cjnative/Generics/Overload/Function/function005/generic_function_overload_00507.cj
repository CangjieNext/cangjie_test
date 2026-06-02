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
    public var a: T
    public init(input: T) {
        a = input
    }
    public func i() {
        var i = this.test(a)
        return i
    }
}

main(): Int64 {
    var res1 = A<Int64>(1).i()
    if (res1 != 2) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
