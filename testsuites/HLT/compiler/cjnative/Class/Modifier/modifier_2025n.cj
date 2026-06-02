/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.collection

var a: ArrayList<A> = ArrayList<A>(2)

open class A {
    init() {
        a.add(this)
    }
}

main() {
    var a = A()
    return 0
}
// ASSERT: scan sema_use_this_as_an_expression_in_func
