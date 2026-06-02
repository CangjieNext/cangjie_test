/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_generic_type_argument_not_match_constraint

open class Foo {}

class Bar <: Foo {}

class A<T> where T <: Bar {}

extend<T> A<T> where T <: Foo {
    public func f1(): Bool {
        true
    }
}

main(): Int64 {
    var res = A<Foo>().f1()
    if (res) {
        return 0
    }
    1
}
