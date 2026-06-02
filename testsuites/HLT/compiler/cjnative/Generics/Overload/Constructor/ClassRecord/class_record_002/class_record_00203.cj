/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<X, Y> {
    public init(a: X) {
        print("A_first")
    }
    public init(a: Y) {
        print("A_second")
    }
}

struct B<X, Y> {
    public init(a: X) {
        print("B_first")
    }
    public init(a: Y) {
        print("B_second")
    }
}

main(): Int64 {
    var i = A<Int64, Int32>(1)
    var j = B<Int64, Int32>(1)
    return 0
}
// ASSERT: scan sema_ambiguous_constructor_match
