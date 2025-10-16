// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg1 pkg2 pkg3
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/pkg1.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg2/pkg2.cj -o pkg2.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg3/pkg3.cj -o pkg3.%middle
// EXEC: %compiler %cmp_opt pkg1.%middle pkg2.%middle pkg3.%middle %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

internal import pkg1.*
internal import pkg1.*
internal import pkg1.*
internal import pkg2.*
internal import pkg3.*

main() {
    if (gTensor == 2 && tTensor == 2) {
        return 0
    }
    return 1
}
