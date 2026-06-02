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

func test<T>(a: T, b: Sub) {} // f1

func test<T>(a: T, b: Base) {} // f2

func g(a: Base): Int64 {
    1
} // g1

func g(a: Sub): Int64 {
    2
} // g2

main(): Int64 {
    var i = test(g, Base())
    return 0
}
// ASSERT: scan sema_no_match_function_declaration_for_call
// ASSERT: scan sema_ambiguous_func_ref
