// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %debugCHIROpt %enableFuncInlining %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args

// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %debugCHIROpt %enableFuncInlining %n.old.cj -o %output 2>&1 | compare %f
// EXEC-1: %run %run_opt %output %run_args 2>&1

// ASSERT: scan incremental compilation triggered
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:foo in file OverflowStragety_FI_1_Incr.old.cj in line 4 in column 13
// ASSERT: scan the changed decl after Spreading is:bar in file OverflowStragety_FI_1_Incr.old.cj in line 9 in column 13
// ASSERT: scan the changed decl after Spreading is:main in file OverflowStragety_FI_1_Incr.old.cj in line 13 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
