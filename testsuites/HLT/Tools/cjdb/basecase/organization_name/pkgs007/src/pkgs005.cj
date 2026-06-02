/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import org5::pkgs.*

main() {
    var a1 = T1<Int64>.Year
    var a2 = a1.f1(3)
    var a3 = T1<Int64>.fun_s1(4)
    var b1 = C1()
    var b2 = b1.f1()
    var b3 = b1.f2()
    var b4 = C1.f3()
    0
}
