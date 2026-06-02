/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

struct A<T>{}

func f<T>(input:A<T>):Int64 {0}

func test<T>(input:T):Int64 {
    return A<Int64>() |> f<T> 

main(): Int64 {
    return test<Int64>(1)
}
// (iOS) ASSERT: scan parse_illegal_modifier_in_scope
// (not iOS) ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_right_delimiter
