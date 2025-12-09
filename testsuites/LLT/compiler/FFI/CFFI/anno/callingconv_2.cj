// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %verbose_opt %f -o %output

@C
@CallingConv[CDECL]
func foo1() {}

@C
@CallingConv[CDECL]
func foo2() {}

main() {}
