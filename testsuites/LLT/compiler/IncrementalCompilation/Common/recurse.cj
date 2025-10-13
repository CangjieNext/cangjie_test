// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC-14: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC-19: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:test in file recurse.old.cj in line 3 in column 6
// ASSERT: scan the changed decl after Spreading is:foo in file recurse.old.cj in line 7 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file recurse.old.cj in line 11 in column 1
// ASSERT: scan the changed decl after Spreading is:zoo in file recurse.old.cj in line 20 in column 17


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
