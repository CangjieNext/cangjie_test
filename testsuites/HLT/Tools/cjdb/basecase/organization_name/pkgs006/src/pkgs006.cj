/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import org::pkgs.*

let pkg_enum_top = TimeUnit1<Int8>.Month(1)
var pkg_r1_top = R1<Int32>(10, 10)
var pkg_c1_top = C1<Float64>(10.0)

func run(): Int64 {
    
    return 1
}

main(): Int64 {
    let pkg_enum_m = TimeUnit1<Int8>.Month(3)
    var pkg_r1_m = R1<Int32>(30, 30)
    var pkg_c1_m = C1<Float64>(30.0)
    let pkg_enum_f = TimeUnit1<Int8>.Month(2)
    var pkg_r1_f = R1<Int32>(20, 20)
    var pkg_c1_f = C1<Float64>(20.0)
    0
}
