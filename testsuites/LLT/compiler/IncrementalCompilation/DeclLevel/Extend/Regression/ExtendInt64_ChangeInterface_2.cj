// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output
// RUN-EXEC-0: %run %run_opt %output %run_args
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC-1: %run %run_opt %output %run_args

// ASSERT: scan changed decls to recompile: 9
// ASSERT: scan the changed decl after Spreading is:I1 in file ExtendInt64_ChangeInterface_2.old.cj in line 1 in column 11
// ASSERT: scan the changed decl after Spreading is:f in file ExtendInt64_ChangeInterface_2.old.cj in line 2 in column 10
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file ExtendInt64_ChangeInterface_2.old.cj in line 4 in column 1
// ASSERT: scan the changed decl after Spreading is:main in file ExtendInt64_ChangeInterface_2.old.cj in line 6 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file to_string.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file countable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file hashable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file comparable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file duration.cj

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
