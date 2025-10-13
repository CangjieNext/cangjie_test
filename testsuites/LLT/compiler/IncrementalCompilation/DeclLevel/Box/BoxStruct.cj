// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC-PIPE: %run %run_opt %output %run_args | compare %n.new.cj

// ASSERT: scan changed decls to recompile: 9
// ASSERT: scan the changed decl after Spreading is:A in file BoxStruct.old.cj in line 1 in column 8
// ASSERT: scan the changed decl after Spreading is:B in file BoxStruct.old.cj in line 4 in column 7
// ASSERT: scan the changed decl after Spreading is:u1 in file BoxStruct.old.cj in line 14 in column 6
// ASSERT: scan the changed decl after Spreading is:u2 in file BoxStruct.old.cj in line 21 in column 6
// ASSERT: scan the changed decl after Spreading is:u3 in file BoxStruct.old.cj in line 27 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file BoxStruct.old.cj in line 38 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file BoxStruct.old.cj in line 42 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file BoxStruct.old.cj in line 43 in column 1
// ASSERT: scan the changed decl after Spreading is:m in file BoxStruct.old.cj in line 44 in column 17

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
