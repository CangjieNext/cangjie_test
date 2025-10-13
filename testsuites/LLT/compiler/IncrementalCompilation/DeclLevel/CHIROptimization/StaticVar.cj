// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %mkdir %n
// EXEC: %cpfile %n.old.cj %n
// EXEC: %compiler %incrementalCompile -O2 %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC: %compiler %incrementalCompile -O2 %cmp_opt %n.%lib_extension %f -o %output
// EXEC-2: %run %run_opt %output %run_args

// EXEC: %rmfile %n/%n.old.cj
// EXEC: %cpfile %n.new.cj %n/%n.old.cj
// EXEC: %compiler %incrementalCompile -O2 %cmp_opt -p %n %compile_lib_opt -o %n.%lib_extension
// EXEC-PIPE: %compiler %incrementalCompile -O2 %cmp_opt %n.%lib_extension %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

internal import p1.*
main() {
    A.b + A().a + A.c
}

// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:main in file StaticVar.cj in line 15 in column 1
// ASSERT: scan the changed decl after Spreading is:c in file StaticVar.old.cj in line 5 in column 25


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
