/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE: %n.c
// (not iOS) EXEC: %clang %clang_opt %n.c -o %cffi_output
// (not iOS) EXEC-PIPE-1: %compiler %cmp_opt %ffic_opt -o %output 2>&1 | compare %f

macro package define

import std.ast.*

@CallingConv[CDECL]
public macro M0(input: Tokens) {
    return quote(0)
}

@CallingConv[CDECL]
public macro M1(input: Tokens) {
    return quote(1)
}

main() {}
// ASSERT: scan sema_only_cfunc_can_use_annotation
