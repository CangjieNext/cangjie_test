// DEPENDENCE: pkg.cj pkg2.cj Fail.expect

// EXEC: %compiler %incrementalCompile %cmp_opt %compile_lib_opt pkg.cj pkg2.cj
// EXEC: %compiler %incrementalCompile %cmp_opt %compile_lib_opt pkg.cj 2>&1 | compare Fail.expect


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
