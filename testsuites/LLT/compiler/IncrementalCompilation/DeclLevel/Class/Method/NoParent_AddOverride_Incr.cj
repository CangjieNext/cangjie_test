// DEPENDENCE: %n.old.cj %n.new.cj %n.3rd.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 1
// ASSERT: scan the changed decl after Spreading is:foo in file NoParent_AddOverride_Incr.old.cj in line 2 in column 26
// ASSERT: scan error: 'override' function 'foo' does not have an overridden function in its supertype
// EXEC: %rmfile $n.old.cj
// EXEC: %move %n.3rd.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
