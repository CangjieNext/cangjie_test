// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 8
// ASSERT: scan the changed decl after Spreading is:SB in file Inherit.old.cj in line 18 in column 8
// ASSERT: scan the changed decl after Spreading is:EB in file Inherit.old.cj in line 20 in column 6
// ASSERT: scan the changed decl after Spreading is:R in file Inherit.old.cj in line 21 in column 2
// ASSERT: scan the changed decl after Spreading is:K in file Inherit.old.cj in line 21 in column 4
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file Inherit.old.cj in line 23 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file Inherit.old.cj in line 25 in column 17
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file Inherit.old.cj in line 27 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file Inherit.old.cj in line 29 in column 17
// ASSERT: scan deleted decls: 4
// ASSERT: scan the deleted decl is:2SB<1A1B><:2IC<1B>X
// ASSERT: scan the deleted decl is:7default7Extend!2SB<1A1B><:2IC<1B>X3fooF$$l
// ASSERT: scan the deleted decl is:2EB<1T><:2IE<1T1T2IE<1T1T1T>>X
// ASSERT: scan the deleted decl is:7default7Extend!2EB<1T><:2IE<1T1T2IE<1T1T1T>>X3fooF$$l

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
