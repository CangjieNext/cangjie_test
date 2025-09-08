// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:A in file MvExtendMethod.old.cj in line 6 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file MvExtendMethod.old.cj in line 10 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file MvExtendMethod.old.cj in line 13 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file MvExtendMethod.old.cj in line 14 in column 17
// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:7default7Extend!1A<1T><:X3fooF$$l

// RUN-EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
