// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output
// EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: scan C 7default1CC DeleteInstantVar.old.cj 1: memory
// ASSERT: scan changed decls to recompile: 5
// ASSERT: scan the changed decl after Spreading is:C in file DeleteInstantVar.old.cj in line 1 in column 12
// ASSERT: scan the changed decl after Spreading is:x in file DeleteInstantVar.old.cj in line 2 in column 16
// ASSERT: scan the changed decl after Spreading is:insideUseMemberVar in file DeleteInstantVar.old.cj in line 17 in column 10
// ASSERT: scan the changed decl after Spreading is:outsideUseMemberVar in file DeleteInstantVar.old.cj in line 20 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file DeleteInstantVar.old.cj in line 24 in column 1
// ASSERT: scan deleted decls: 1
// ASSERT: scan the deleted decl is:7default1CC1yV$$l


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
