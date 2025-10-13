enum TimeUnit1 {
    Year
}

enum TimeUnit2 {
    | Year(Int8)
}

enum TimeUnit3 {
    Month(Int32, Int64)
}

enum TimeUnit4 {
    | Day(UInt8, UInt16, UInt32)
    | Hour(UInt64, Int16, Float32, Float64)
}

let time_1 = TimeUnit1.Year
var time_2 = TimeUnit2.Year(19)
var time_3 = TimeUnit3.Month(1, 2)

main() {
    let time1 = TimeUnit1.Year
    var time2 = TimeUnit2.Year(19)
    var time3 = TimeUnit3.Month(1, 2)
    var time4 = Year
    var time5 = Year(2)
    var time6 = Day(1, 2, 3)
    var time7 = Hour(1, 2, 3.0, 4.0)
    var time8 = TimeUnit4.Day(1, 2, 3)
    var time9 = TimeUnit4.Hour(1, 2, 3.0, 4.0)

    return 0
}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
