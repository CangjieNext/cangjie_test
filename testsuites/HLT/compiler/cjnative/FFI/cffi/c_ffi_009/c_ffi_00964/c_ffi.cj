/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f %cmp_opt -o %output 2>&1 | compare %f

interface I1 {}

type I2 = I1

@C
struct TEST<T> where T <: I2 {}

@C
struct TEST2<I2> {}

main() {}
// ASSERT: scan sema_cffi_cannot_have_type_param
