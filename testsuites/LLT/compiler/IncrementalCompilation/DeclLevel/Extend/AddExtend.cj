// DEPENDENCE: %n.old.cj %n.new.cj %n.pkg.cj
// EXEC: %compiler %compile_lib_opt %n.pkg.cj -o libp1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt %n.old.cj libp1.%lib_extension -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt %n.old.cj libp1.%lib_extension -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:A1 in file AddExtend.old.cj in line 5 in column 14
// ASSERT: scan the changed decl after Spreading is:A2 in file AddExtend.old.cj in line 6 in column 15
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddExtend.old.cj in line 8 in column 1
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file AddExtend.old.cj in line 9 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
