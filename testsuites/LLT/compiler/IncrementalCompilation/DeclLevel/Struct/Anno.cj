// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-1: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f

// ASSERT: scan changed decls to recompile: 12
// ASSERT: scan the changed decl after Spreading is:SA in file Anno.old.cj in line 2 in column 8
// ASSERT: scan the changed decl after Spreading is:SB in file Anno.old.cj in line 4 in column 8
// ASSERT: scan the changed decl after Spreading is:SC in file Anno.old.cj in line 6 in column 8
// ASSERT: scan the changed decl after Spreading is:SE in file Anno.old.cj in line 10 in column 8
// ASSERT: scan the changed decl after Spreading is:SF in file Anno.old.cj in line 12 in column 8
// ASSERT: scan the changed decl after Spreading is:a in file Anno.old.cj in line 20 in column 5
// ASSERT: scan the changed decl after Spreading is:CA in file Anno.old.cj in line 22 in column 7
// ASSERT: scan the changed decl after Spreading is:CB in file Anno.old.cj in line 24 in column 7
// ASSERT: scan the changed decl after Spreading is:IA in file Anno.old.cj in line 26 in column 11
// ASSERT: scan the changed decl after Spreading is:EA in file Anno.old.cj in line 28 in column 6
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file Anno.old.cj in line 32 in column 1
// ASSERT: scan the changed decl after Spreading is:b in file Anno.old.cj in line 36 in column 5

// ASSERT: scan 8 errors generated, 8 errors printed


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
