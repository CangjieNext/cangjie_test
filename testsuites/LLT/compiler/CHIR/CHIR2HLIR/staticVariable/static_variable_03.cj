// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

let resLet = 2
var resVar = resLet // 2

open class Son {
    public static let ageLet: Int64 = getNum() // 13
    public static var ageVar: Int64 = foo(-4) // 17
    public static func getNum() {
        13
    }
}

struct RA {
    public static let idLet: Int64 = Son.ageVar // 17
    public static var idVar: Unit = ()
}

func foo(param: Int64) {
    Son.ageLet - param
}

main(): Int64 {
    var res = resVar + Son.ageVar + RA.idLet
    // res will be: 2 + 17 + 17 = 36
    resVar = 31
    Son.ageVar = 37
    RA.idVar = ()
    res = res + resLet + resVar + Son.ageVar + Son.ageLet + RA.idLet + foo(RA.idLet)
    // res will be: 36 + 2 + 31 + 37 + 13 + 17 - 4 = 132
    return res - 132
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
