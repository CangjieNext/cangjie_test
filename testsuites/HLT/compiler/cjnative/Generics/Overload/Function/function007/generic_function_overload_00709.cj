/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class Base {}

class Sub <: Base {}

func f(a: (Base) -> Int64, b: Sub) {
    return a(Base()) + 1
} //f1

func f(a: (Sub) -> Int64, b: Base) {
    return a(Sub()) + 2
} //f2

func g(a: Base): Int64 {
    return 1
} //g1

func g(a: Sub): Int64 {
    return 2
} //g2

main(): Int64 {
    var i = f(g, Base())
    if (i != 4) {
        return 1
    }
    return 0
}
// ASSERT: scan sema_no_match_function_declaration_for_call
// ASSERT: scan sema_ambiguous_func_ref
