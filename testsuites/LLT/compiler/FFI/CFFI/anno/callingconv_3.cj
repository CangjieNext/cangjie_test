// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f %diag_json -o %output 2>&1 | compare %f
// ASSERT: scan-5 sema_annotation_calling_conv_not_support

@C
@CallingConv[C]
func foo1() {}

@C
@CallingConv[X]
func foo2() {}

@C
@CallingConv[JavaScript]
func foo3() {}

@C
@CallingConv[Java]
func foo4() {}

@C
@CallingConv[STDCALL]
func foo5() {}

main() {}
