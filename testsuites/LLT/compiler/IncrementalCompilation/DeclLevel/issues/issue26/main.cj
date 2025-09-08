// DEPENDENCE: %n.old.cj %n.new.cj pkg.old.cj pkg.new.cj
// EXEC: %compiler %incrementalCompile pkg.old.cj -O2 -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC: %compiler %incrementalCompile %n.old.cj libpkg1.%lib_extension -O2 %cmp_opt -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// EXEC: %cpfile pkg.new.cj pkg.old.cj
// EXEC: %cpfile %n.new.cj %n.old.cj
// EXEC: %compiler %incrementalCompile pkg.old.cj -O2 -Woff unused %compile_lib_opt -o libpkg1.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile %n.old.cj libpkg1.%lib_extension -O2 %cmp_opt -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan changed decls to recompile: 7
// ASSERT: scan the changed decl after Spreading is:main in file main.old.cj in line 3 in column 1
// ASSERT: scan the changed decl after Spreading is:faterInterface in file pkg.old.cj in line 4 in column 18
// ASSERT: scan the changed decl after Spreading is:foo1 in file pkg.old.cj in line 6 in column 14
// ASSERT: scan the changed decl after Spreading is:foo2 in file pkg.old.cj in line 8 in column 14
// ASSERT: scan the changed decl after Spreading is:foo1 in file pkg.old.cj in line 16 in column 21
// ASSERT: scan the changed decl after Spreading is:foo1 in file pkg.old.cj in line 25 in column 21
// ASSERT: scan the changed decl after Spreading is:foo1 in file pkg.old.cj in line 34 in column 21



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
