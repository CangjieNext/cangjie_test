// DEPENDENCE: pkg
// EXEC: %compiler %incrementalCompile pkg/pkg.old.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incrementalCompile %cmp_opt pkg.%middle test.cj -o %output
// EXEC: %run %run_opt %output %run_args | compare pkg/pkg.old.cj
// EXEC: %rmfile pkg/pkg.old.cj
// EXEC: %cpfile pkg/pkg.new.cj pkg/pkg.old.cj
// EXEC: %compiler %incrementalCompile pkg/pkg.old.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incrementalCompile %cmp_opt pkg.%middle test.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 4
// ASSERT: scan the changed decl after Spreading is:y in file pkg.old.cj in line 3 in column 14
// ASSERT: scan the changed decl after Spreading is:genericF in file pkg.old.cj in line 7 in column 13
// ASSERT: scan the changed decl after Spreading is:genericG in file pkg.old.cj in line 12 in column 13
// ASSERT: scan the changed decl after Spreading is:main in file test.cj in line 18 in column 1
// EXEC: %run %run_opt %output %run_args | compare pkg/pkg.new.cj

internal import pkg.*
 
main():Int64{
    genericF<Int64>()
    genericG<Int64>()
    0
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
