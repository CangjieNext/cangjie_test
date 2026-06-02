// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: p1
// EXEC:%compiler   p1/test0.cj %compile_lib_opt -o test0.%middle
// EXEC:%compiler   test0.%middle test1.cj -o %output
// EXEC: %run %output

import pkga.pkgb.pkgc.pkgd.pkge.a

main(): Int64 {
    let e2: Int32 = a.six
    if (e2 != 6) {
        return 1
    }
    return 0
}
