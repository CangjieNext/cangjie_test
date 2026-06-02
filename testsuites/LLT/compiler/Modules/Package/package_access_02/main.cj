// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg.cj -o pkg.%middle
// ERRCHECK:%compiler %cmp_opt pkg.%middle %f -o %output 2>&1 | compare %f
// ASSERT: scan package 'a.b.c' is 'internal' which cannot be imported by same module package 'a'

package a

import a.b.c

main(): Int64 {
    return a - 1
}
