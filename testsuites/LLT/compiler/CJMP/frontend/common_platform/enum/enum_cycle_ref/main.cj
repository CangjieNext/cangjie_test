// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// DEPENDENCE: common.cj platform.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt common.cj -o common.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt platform.cj -o platform.%middle
// EXEC: %compiler %cmp_opt pkg.%middle %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

import pkg.*

main() {
    let c = EA.C 
    let ca = CA(c)
    let ea = EA.A(ca)
    return 0
}

