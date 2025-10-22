// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// DEPENDENCE: common.cj platform.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt --experimental --output-type=chir  common.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt --experimental --common-part-cjo=pkg.cjo platform.cj ./pkg.chir --output=dylib
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix --import-path=. -L./ -lpkg
// EXEC: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:. %run %run_opt %n.%suffix

import pkg.*

main() {
    let c = EA.C
    let ca = CA(c)
    let ea = EA.A(ca)
    return 0
}
