// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I {
    func fooI() {}
    static func gooI() {}
}

open class A <: I {
    static var aA: Int64 = 0
    var bA: Int32 = 0

    func fooA() {}
    static func gooA() {}
}

class B <: A {
    static var aB: Int64 = 0
    var bB: Int32 = 0

    func fooB() {}
    static func gooB() {}
}

main(): Int32 {
    var b = B()
    return 0
}
