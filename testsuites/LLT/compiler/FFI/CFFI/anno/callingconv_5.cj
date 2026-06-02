// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f %diag_json -o %output 2>&1 | compare %f
// ASSERT: scan-4 sema_annotation_error_arg_num
// ASSERT: scan-2 sema_annotation_invalid_args_type

@CallingConv
foreign func foo1(): Unit

@C
@CallingConv
func foo2() {}

@CallingConv[1]
foreign func foo3(): Unit

@C
@CallingConv[1]
func foo4() {}

@CallingConv[1, 2]
foreign func foo5(): Unit

@C
@CallingConv[1, 2]
func foo6() {}

main() {}
