// DEPENDENCE: ../%n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj %n.inc.cj
// EXEC: %compiler %incrementalCompile %n.inc.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.inc.cj
// EXEC-PIPE-1: %compiler %incrementalCompile %n.inc.cj -o %output 2>&1 | compare %f
// ASSERT: scan incremental compilation triggered
// ASSERT: scan changed decls to recompile: 10
// ASSERT: scan the changed decl after Spreading is:A in file test.inc.cj in line 6 in column 12
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file test.inc.cj in line 9 in column 1
// ASSERT: scan the changed decl after Spreading is:B in file test.inc.cj in line 18 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file test.inc.cj in line 20 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file test.inc.cj in line 23 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file test.inc.cj in line 28 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file test.inc.cj in line 32 in column 1
// ASSERT: scan the changed decl after Spreading is:goo in file test.inc.cj in line 33 in column 17
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file test.inc.cj in line 38 in column 1
// ASSERT: scan the changed decl after Spreading is:test in file test.inc.cj in line 39 in column 17
// ASSERT: scan extend member 'goo' is not allowed to shadow members of 'extend B'
// ASSERT: scan extend member 'test' is not allowed to shadow members of 'extend A'


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
