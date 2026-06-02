/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A{
    public operator func !(input:A):A{input}
    public operator func ~(input:A):A{input}
}



main(): Int64 {
    A() |> !;  
    - ~> !;   

    return 1
}
// ASSERT: scan parse_invalid_overloaded_operator
// ASSERT: scan parse_expected_expression
