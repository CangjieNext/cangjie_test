/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt ./p2/*.cj -o p2.%middle
// EXEC: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package p0

import p1.foo as goo

public func goo(a: Int8) {
    return 1
}

public func goo(a: Int16) {
    return 2
}

public func goo(a: Int32) {
    return 3
}

public func goo(a: Int64) {
    return 4
}

main(): Int64 {
    var a1 = goo(Int8(1))
    var a2 = goo(Int16(1))
    var a3 = goo(Int32(1))
    var a4 = goo(Int64(1))
    return 0
}
