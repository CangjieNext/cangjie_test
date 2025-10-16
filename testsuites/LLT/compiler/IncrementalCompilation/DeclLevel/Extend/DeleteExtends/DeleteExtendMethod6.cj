// DEPENDENCE: %n.pkg.cj %n.old.cj %n.new.cj
// EXEC: %mkdir p1
// EXEC: %cpfile %n.pkg.cj p1
// EXEC: %compiler %incrementalCompile %cmp_opt -p p1 %compile_lib_opt -o libp1.%lib_extension
// EXEC: %compiler %incrementalCompile %cmp_opt libp1.%lib_extension %n.old.cj -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args
// EXEC: %rmfile %n.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC-PIPE: %compiler %incrementalCompile %cmp_opt libp1.%lib_extension %n.old.cj -o %output | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 3
// ASSERT: scan the changed decl after Spreading is:A in file DeleteExtendMethod6.pkg.cj in line 6 in column 14
// ASSERT: scan the changed decl after Spreading is:ExtendDecl in file DeleteExtendMethod6.old.cj in line 8 in column 1
// ASSERT: scan the changed decl after Spreading is:main in file DeleteExtendMethod6.old.cj in line 17 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
