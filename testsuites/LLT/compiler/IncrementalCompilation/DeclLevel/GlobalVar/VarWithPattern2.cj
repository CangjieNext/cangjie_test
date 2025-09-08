// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %enableCompileDebug %n.old.cj -o %output
// EXEC-6: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %enableCompileDebug %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 7
// ASSERT: scan the changed decl after Spreading is:VarWithPatternDecl in file VarWithPattern2.old.cj in line 1 in column 1
// ASSERT: scan the changed decl after Spreading is:a in file VarWithPattern2.old.cj in line 1 in column 6
// ASSERT: scan the changed decl after Spreading is:b in file VarWithPattern2.old.cj in line 1 in column 10
// ASSERT: scan the changed decl after Spreading is:c in file VarWithPattern2.old.cj in line 1 in column 13
// ASSERT: scan the changed decl after Spreading is:useA in file VarWithPattern2.old.cj in line 3 in column 6
// ASSERT: scan the changed decl after Spreading is:useB in file VarWithPattern2.old.cj in line 4 in column 6
// ASSERT: scan the changed decl after Spreading is:useC in file VarWithPattern2.old.cj in line 5 in column 6
// EXEC-7: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
