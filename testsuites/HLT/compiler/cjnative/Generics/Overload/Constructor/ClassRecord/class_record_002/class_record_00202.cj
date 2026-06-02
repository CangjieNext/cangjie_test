/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    init(a: T) {
        print("A_first")
    }
    init(a: Int64) {
        print("A_second")
    }
}

struct B<T> {
    init(a: T) {
        print("B_first")
    }
    init(a: Int64) {
        print("B_second")
    }
}

main(): Int64 {
    var i = A<Int64>(1)
    var j = B<Int64>(1)
    return 0
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
