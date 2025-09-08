// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %enableCompileDebug %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %enableCompileDebug -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 15
// ASSERT: scan the changed decl after Spreading is:A in file ArgPosGe.old.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:foo in file ArgPosGe.old.cj in line 2 in column 10
// ASSERT: scan the changed decl after Spreading is:B in file ArgPosGe.old.cj in line 5 in column 8
// ASSERT: scan the changed decl after Spreading is:bar in file ArgPosGe.old.cj in line 6 in column 14
// ASSERT: scan the changed decl after Spreading is:get in file ArgPosGe.old.cj in line 7 in column 9
// ASSERT: scan the changed decl after Spreading is:set in file ArgPosGe.old.cj in line 8 in column 9
// ASSERT: scan the changed decl after Spreading is:B in file ArgPosGe.old.cj in line 14 in column 5
// ASSERT: scan the changed decl after Spreading is:C in file ArgPosGe.old.cj in line 18 in column 6
// ASSERT: scan the changed decl after Spreading is:R in file ArgPosGe.old.cj in line 19 in column 5
// ASSERT: scan the changed decl after Spreading is:K in file ArgPosGe.old.cj in line 19 in column 7
// ASSERT: scan the changed decl after Spreading is:too in file ArgPosGe.old.cj in line 21 in column 10
// ASSERT: scan the changed decl after Spreading is:D in file ArgPosGe.old.cj in line 33 in column 11
// ASSERT: scan the changed decl after Spreading is:foo in file ArgPosGe.old.cj in line 34 in column 10
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ArgPosGe.old.cj in line 38 in column 1
// ASSERT: scan the changed decl after Spreading is:bar in file ArgPosGe.old.cj in line 39 in column 10

// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
