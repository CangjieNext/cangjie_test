// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %n.old.cj -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 8
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddExtend1to2_Primtive.old.cj in line 1 in column 1
// ASSERT: scan the changed decl after Spreading is:main in file AddExtend1to2_Primtive.old.cj in line 5 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddExtend1to2_Primtive.old.cj in line 10 in column 1
// ASSERT: scan the changed decl after Spreading is:foo in file AddExtend1to2_Primtive.old.cj in line 11 in column 17
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file countable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file to_string.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file hashable.cj
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file comparable.cj

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
