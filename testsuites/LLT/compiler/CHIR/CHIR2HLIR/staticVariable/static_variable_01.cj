// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0

// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

let resLet = 2
var resVar = 7

open class Son {
    public static let ageLet: Int64 = 13
    public static var ageVar: Int64 = 17
}

struct RA {
    public static let idLet: Int64 = 23
    public static var idVar: Int64 = 29
}

func foo(param: Int64) {
    Son.ageVar - param
    // it will return: 37 - 41 = -4
}

main(): Int64 {
    var res = resVar + Son.ageVar + RA.idVar
    // res will be: 7 + 17 + 29 = 53
    resVar = 31
    Son.ageVar = 37
    RA.idVar = 41
    res = res + resLet + resVar + Son.ageVar + RA.idVar + Son.ageLet + RA.idLet + foo(RA.idVar)
    // res will be: 53 + 2 + 31 + 37 + 41 + 13 + 23 - 4 = 196
    return res - 196
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
