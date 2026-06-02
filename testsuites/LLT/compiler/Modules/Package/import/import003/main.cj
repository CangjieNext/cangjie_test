// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/A.cj -o pkg1/A.%middle
// EXEC: %compiler %cmp_opt pkg1/A.%middle %n.cj --import-path pkg1 -o %output
// EXEC: %run %run_opt %output %run_args

package pkg2

internal import A.*

main() {
    var a: AA = 0;
    var b = a + 1
    return 0
}
