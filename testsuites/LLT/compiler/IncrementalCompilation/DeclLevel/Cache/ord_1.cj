// DEPENDENCE: pkg.cj Full.expect NoChange.expect
// EXEC: %mkdir test1 test1/inc
// EXEC: %cpfile pkg.cj test1/inc
// EXEC: %cd test1 && %compiler %cmp_opt %incrementalCompile -p inc %compile_lib_opt -o A.%lib_extension 2>&1 | compare ../Full.expect

// EXEC: %cpdir test1 test2
// EXEC: %cd test2 && %compiler %cmp_opt %incrementalCompile -p inc %compile_lib_opt -o A.%lib_extension 2>&1 | compare ../NoChange.expect


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
