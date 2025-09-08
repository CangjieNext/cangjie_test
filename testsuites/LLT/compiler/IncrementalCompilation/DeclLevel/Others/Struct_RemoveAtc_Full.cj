// DEPENDENCE: %n.old.cj %n.new.cj %n.c
// EXEC: %clang -c %n.c -o %n.o
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj %n.o -o %output
// EXEC-2: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %move %n.new.cj %n.old.cj
// EXEC-PIPE-0: %compiler %incrementalCompile %cmp_opt %n.old.cj %n.o -o %output 2>&1 | compare %f
// ASSERT: scan-not rollback
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:A in file Struct_RemoveAtc_Full.old.cj in line 2 in column 8
// ASSERT: scan the changed decl after Spreading is:foo in file Struct_RemoveAtc_Full.old.cj in line 5 in column 6
// ASSERT: scan the changed decl after Spreading is:main in file Struct_RemoveAtc_Full.old.cj in line 6 in column 1
// EXEC-3: %run %run_opt %output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
