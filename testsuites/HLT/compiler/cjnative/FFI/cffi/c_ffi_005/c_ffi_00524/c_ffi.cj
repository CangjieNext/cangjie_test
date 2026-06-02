/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

var mem1: CFunc<(CType) -> CType> = {a: Int32 => return Int64(a) + 1}
var mem2: CFunc<(CType, CType) -> CType> = {a: CType, b: CType => return Int64(a) + b}
var mem3: CFunc<(CType, CType, CType) -> CType> = {a: CType, b: Int64, c: CType => return Int64(a) + b + c}

main(): Int64 {}
// ASSERT: scan sema_invalid_cfunc_arg_type
// ASSERT: scan sema_invalid_cfunc_return_type
// ASSERT: scan sema_mismatched_types
// ASSERT: scan sema_numeric_convert_must_be_numeric
// ASSERT: scan sema_mismatched_types_because
