/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Z<T> {
    public func foo() {}
}

class C<X> where X <: Z<C<Z<C<Int32>>>> {
    public init(input: X) {
        let a: Unit = input.foo()
    }
}

interface I<X> where X <: Z<I<Z<I<Int32>>>> {
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_generic_type_argument_not_match_constraint
