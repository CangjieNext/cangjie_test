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

interface I {}

class A<T> where T <: Foo {}

extend<K> A<K> {
    func test(): Int32 {
        return 1
    }
}

main(): Int64 {
    var res = A<I>().test()
    if (res) {
        return 0
    }
    1
}
