// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/A.cj -o pkg1/A.%middle
// EXEC: %compiler %cmp_opt  pkg1/A.%middle %f --import-path pkg1 -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg1.C

main(): Int64 {
    return 0
}
