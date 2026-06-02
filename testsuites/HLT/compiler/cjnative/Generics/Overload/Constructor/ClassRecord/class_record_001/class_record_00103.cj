/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    init(a: Int16) {
        print("A_first")
    }
    init(a: Int32) {
        print("A_second")
    }
}

struct B {
    init(a: Int16) {
        print("B_first")
    }
    init(a: Int32) {
        print("B_second")
    }
}

main(): Int64 {
    var i = A(1)
    var j = B(1)
    return 0
}
// ASSERT: scan sema_ambiguous_constructor_match
