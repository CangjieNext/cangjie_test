// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

enum TimeUnit<T> {
    century
    | Year(T)
    | Month(Int32, Int32)
    | Day(Int32, Int32, T)
}

enum TimeUnit1 {
    Year(Rune) | Month(Rune)
}

func codegenUnitTest(): Int32 {
    var y: Int32 = 10
    var yy: Int32 = 1000
    var time = century<Int32>
    var time1 = TimeUnit<Int32>.Year(y)
    var time2 = TimeUnit<Int32>.Month(y, y * 9)
    var time3 = Day<Int32>(yy, yy, yy)
    var time4 = TimeUnit.Year(y)
    var time5 = Year(yy)
    var ans: Int32 = match (time) { // 1
        case century => 1
        case Year(x) => x
        case Month(x, y) => x + y
        case Day(x, y, z) => x + y + z
    } + match (time1) { // 10
        case century => 1
        case Year(x) => x
        case Month(x, y) => x + y
        case Day(x, y, z) => x + y + z
    } + match (time2) { // 100
        case century => 1
        case Year(x) => x
        case Month(x, y) => x + y
        case Day(x, y, z) => x + y + z
    } + match (time3) { // 3000
        case century => 1
        case Year(x) => x
        case Month(x, y) => x + y
        case Day(x, y, z) => x + y + z
    }
    return ans
}

main(): Int64 {
    var ret = codegenUnitTest()
    if (ret == 3111) {
        return 0
    } else {
        return -1
    }
}
