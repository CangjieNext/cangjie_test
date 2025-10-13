// DEPENDENCE: pkg1.cj use_pkg_mod.cj Fail.expect NoChange.expect
// EXEC: %mkdir dir1
// EXEC: %cpfile use_pkg_mod.cj dir1

// EXEC: %mkdir dir1/test dir1/test/inc
// EXEC: %mkdir dir1/outputDir dir1/outputDir/test
// EXEC: %cpfile pkg1.cj dir1/test/inc/pkg.cj
// EXEC: %cd dir1 && %compiler %cmp_opt %incrementalCompile -p test/inc %compile_lib_opt --output-dir outputDir/test 2>&1 | compare ../Fail.expect

// EXEC: %cd dir1/outputDir
// EXEC: %cd dir1 && %compiler %cmp_opt %incrementalCompile --import-path outputDir outputDir/test/libtest.inc.a use_pkg_mod.cj -o %output 2>&1 | compare ../Fail.expect
// EXEC-5: %run %run_opt dir1/%output %run_args


// EXEC: %cpdir dir1 dir2

// EXEC: %cd dir2 && %compiler %cmp_opt %incrementalCompile -p test/inc %compile_lib_opt --output-dir outputDir/test 2>&1 | compare ../NoChange.expect
// EXEC: %cd dir2 && %compiler %cmp_opt %incrementalCompile --import-path outputDir outputDir/test/libtest.inc.a use_pkg_mod.cj -o %output 2>&1 | compare ../NoChange.expect
// EXEC-5: %run %run_opt dir2/%output %run_args


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
