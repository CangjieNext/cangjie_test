// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 7
// ASSERT: scan the changed decl after Spreading is:A in file Init_NT.old.cj in line 1 in column 7
// ASSERT: scan the changed decl after Spreading is:a in file Init_NT.old.cj in line 2 in column 9
// ASSERT: scan the changed decl after Spreading is:b in file Init_NT.old.cj in line 3 in column 9
// ASSERT: scan the changed decl after Spreading is:c in file Init_NT.old.cj in line 4 in column 9
// ASSERT: scan the changed decl after Spreading is:d in file Init_NT.old.cj in line 6 in column 5
// ASSERT: scan the changed decl after Spreading is:B in file Init_NT.old.cj in line 9 in column 8
// ASSERT: scan the changed decl after Spreading is:a in file Init_NT.old.cj in line 10 in column 9
// EXEC: %run %run_opt %output %run_args

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
