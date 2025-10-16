// DEPENDENCE: pkg.cj Fail.expect NoChange.expect
// EXEC: %mkdir dir1
// EXEC: %mkdir dir1/outputDir
// EXEC: %mkdir dir1/inc
// EXEC: %cpfile pkg.cj dir1/inc
// EXEC: %cd dir1 && %compiler %cmp_opt %incrementalCompile -p inc %compile_lib_opt --module-name test 2>&1 | compare ../Fail.expect

// EXEC: %cpdir dir1 dir2
// EXEC: %cd dir2 && %compiler %cmp_opt %incrementalCompile -p inc %compile_lib_opt --module-name test 2>&1 | compare ../NoChange.expect


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
