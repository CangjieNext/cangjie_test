// DEPENDENCE: old new
// EXEC: %mkdir inc
// EXEC: %cpdir old/* inc/.
// EXEC: %compiler %incrementalCompile %cmp_opt -p inc/pkg1 %compile_lib_opt -o pkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt -p inc/pkg2 %compile_lib_opt -o pkg2.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt pkg2.%lib_extension pkg1.%lib_extension inc/%f -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %cpdir new/* inc/.
// EXEC: %rmfile %output
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt -p inc/pkg1 %compile_lib_opt -o pkg1.%lib_extension 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt -p inc/pkg2 %compile_lib_opt -o pkg2.%lib_extension 2>&1 | compare %f
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt pkg2.%lib_extension pkg1.%lib_extension inc/%f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan incremental compilation triggered


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
