/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var c1: Coo = Coo()
    c1.a++
    if (c1.a != 2) {
        return 1
    }
    Coo.c++
    if (Coo.c != 2) {
        return 1
    }
    var a1: Aoo = Aoo()
    a1.a++
    if (a1.a != 2) {
        return 2
    }
    let a2: Aoo = Aoo()
    a2.a++
    if (a2.a != 2) {
        return 3
    }
    Aoo.c++
    if (Aoo.c != 2) {
        return 1
    }
    var d: Int32 = 1
    d++
    if (d != 2) {
        return 4
    }
    return 0
}

struct Coo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public static var c: Int32 = 1
    public static let d: Int32 = 1
    public init() {}
}

class Aoo {
    public var a: Int32 = 1
    public let b: Int32 = 1
    public static var c: Int32 = 1
    public static let d: Int32 = 1
}
