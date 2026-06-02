/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {}

interface B {}

class C <: A & B {}

class X {
    init(a: A) {
        print("A_first")
    }
    init(a: B) {
        print("A_second")
    }
}

struct Y {
    init(a: A) {
        print("B_first")
    }
    init(a: B) {
        print("B_second")
    }
}

main(): Int64 {
    var i = X(C())
    var j = Y(C())
    return 0
}
// ASSERT: scan sema_ambiguous_constructor_match
