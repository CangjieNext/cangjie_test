// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/A.cj -o pkg1/A.%middle
// EXEC: %compiler %cmp_opt  pkg1/A.%middle %f --import-path pkg1 -o %n.%suffix 2>&1 | compare %f
// ASSERT: regex 'B' is not accessible in package 'pkg1'

internal import pkg1.B

main(): Int64 {
    return 0
}
