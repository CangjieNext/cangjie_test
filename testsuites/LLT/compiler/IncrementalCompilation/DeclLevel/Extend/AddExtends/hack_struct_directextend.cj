// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:A in file hack_struct_directextend.old.cj in line 8 in column 7
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file hack_struct_directextend.old.cj in line 12 in column 1
// ASSERT: scan the changed decl after Spreading is:main in file hack_struct_directextend.old.cj in line 16 in column 1

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
