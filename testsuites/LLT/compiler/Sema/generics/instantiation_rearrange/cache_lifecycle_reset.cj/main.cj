// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./pkglib/pkglib.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt pkglib.cj -o pkglib.%middle %enableO2
// EXEC: %compiler %cmp_opt %enableO2 %f pkglib.%middle -o %output
// EXEC: %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan 1
// ASSERT: scan hello

import pkglib.*

main(): Int64 {
    var bi = BoxCus<Int64>(1)
    var bs = BoxCus<String>("hello")
    bi.show()
    bs.show()
    0
}
