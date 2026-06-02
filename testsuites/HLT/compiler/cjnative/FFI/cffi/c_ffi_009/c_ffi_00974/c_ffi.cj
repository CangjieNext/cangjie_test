/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

@C
enum enumA {
    F(Int64)
}

type A = enumA

@C
enum E {
    | F1(Int64)
    | F2(Int64, Int64, Int64)
}

@C
func f1(a: Int64) {}

@C
func f2(a: Int64, b: Int64) {}

@C
main() {}
// ASSERT: scan sema_illegal_use_of_annotation
// ASSERT: scan sema_enum_pattern_func_cty_error
