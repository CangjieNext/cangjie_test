// DEPENDENCE: pkg
// EXEC: %compiler %incrementalCompile %optimization_level_2 pkg/pkg.old.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incrementalCompile %optimization_level_2 %cmp_opt pkg.%middle test.cj -o %output
// EXEC-1: %run %run_opt %output %run_args
// EXEC: %rmfile pkg/pkg.old.cj
// EXEC: %move pkg/pkg.new.cj pkg/pkg.old.cj
// EXEC: %compiler %incrementalCompile %optimization_level_2 pkg/pkg.old.cj %compile_lib_opt -o pkg.%middle
// EXEC: %compiler %incrementalCompile %optimization_level_2 %cmp_opt pkg.%middle test.cj -o %output 2>&1 | compare %f
// ASSERT: scan changed decls to recompile: 2
// ASSERT: scan the changed decl after Spreading is:x in file pkg.old.cj in line 3 in column 14
// ASSERT: scan the changed decl after Spreading is:a in file test.cj in line 16 in column 5
// EXEC: %run %run_opt %output %run_args

import pkg

var a:Int64 = pkg.x - 1
 
main():Int64{
    a 
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
