// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:I in file InheritInterface.old.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:cjTest30447300425032884 in file InheritInterface.old.cj in line 2 in column 10
// ASSERT: scan the changed decl after Spreading is:A in file InheritInterface.old.cj in line 7 in column 7
// ASSERT: scan the changed decl after Spreading is:foo in file InheritInterface.old.cj in line 11 in column 17
// ASSERT: scan the changed decl after Spreading is:main in file InheritInterface.old.cj in line 17 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
