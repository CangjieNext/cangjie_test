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

@C
foreign func testfunc1(arg: Unit): Unit

@C
foreign func testfunc2(arg1: Unit, arg2: Unit): Unit

@C
foreign func testfunc3(arg1: Unit, arg2: Unit, arg3: Unit): Unit

main() {}
// ASSERT: scan sema_cfunc_cannot_have_unit_args
