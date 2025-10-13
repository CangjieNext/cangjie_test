// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt -Woff unused %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile -Woff unused %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 11
// ASSERT: scan the changed decl after Spreading is:a in file CStruct.old.cj in line 6 in column 9
// ASSERT: scan the changed decl after Spreading is:D in file CStruct.old.cj in line 14 in column 11
// ASSERT: scan the changed decl after Spreading is:a in file CStruct.old.cj in line 15 in column 9
// ASSERT: scan the changed decl after Spreading is:u1 in file CStruct.old.cj in line 19 in column 6
// ASSERT: scan the changed decl after Spreading is:u2 in file CStruct.old.cj in line 23 in column 6
// ASSERT: scan the changed decl after Spreading is:m in file CStruct.old.cj in line 16 in column 9
// ASSERT: scan the changed decl after Spreading is:C in file CStruct.old.cj in line 9 in column 11
// ASSERT: scan the changed decl after Spreading is:A in file CStruct.old.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:q in file CStruct.old.cj in line 10 in column 9
// ASSERT: scan the changed decl after Spreading is:B in file CStruct.old.cj in line 5 in column 11
// ASSERT: scan the changed decl after Spreading is:d in file CStruct.old.cj in line 11 in column 9


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
