/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

import std.runtime.*

var flag = 0

func foo(a: A) {}

class A {
    ~init() {
        return this
    }
}

func test() {
    var a = A()
}

main() {
    test()
    GC()
    print("flag is ${flag}")
    return 0
}
// ASSERT: scan sema_use_this_as_an_expression_in_func
// ASSERT: scan sema_mismatched_types
