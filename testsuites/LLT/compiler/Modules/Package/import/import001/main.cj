// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: M1 M2 M3
// EXEC: %compiler %cmp_opt %mod_name_opt M1 %compile_lib_opt M1/pkg1.cj -o M1/pkg1.%middle
// EXEC: %compiler %cmp_opt %mod_name_opt M2 %compile_lib_opt M2/pkg2.cj -o M2/pkg1.%middle
// EXEC: %compiler %cmp_opt %mod_name_opt M3 %compile_lib_opt M3/pkg3.cj -o M3/pkg3.%middle
// EXEC: %compiler %cmp_opt M1/pkg1.%middle M2/pkg1.%middle M3/pkg3.%middle %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

internal import M1.pkg1.*
internal import M2.pkg1.*
internal import M3.pkg3.*

main() {
    var a = foo3().a1
    if (a == 1) {
        return 0
    }
    return 1
}
