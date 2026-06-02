/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





enum TimeUnit1 {
    Year
}

enum TimeUnit2 {
    | Year(Int8)
    | Month(Int32, Int64)
    | Day(UInt8, UInt16, UInt32)
    | Hour(UInt64, Int16, Float32, Float64)
    | Minu(Float32, Float32, Float32, Float32, Float32)
}



main() {
    let time1 = TimeUnit1.Year
    var howManyYears: Int32 = match (time1) {
        case Year => 365 * 24 // matched
        case _ => 0
    }
    var time2 = TimeUnit2.Year(19)
    var time3 = TimeUnit2.Month(1, 2)
    var time4 = Year // syntax sugar of'TimeUnit1.Year'
    var time5 = Day(1, 2, 3) // syntax sugar of'TimeUnit2.Day'
    var time6 = Hour(1, 2, 3.0, 4.0) // syntax sugar of'TimeUnit2.Hour'
    var time7 = Minu(1.0, 2.0, 3.0, 4.0, 5.0) // syntax sugar of'TimeUnit2.Minu'

    var howManyMinus: Float32 = match (time7) {
        case Minu(y, m, d, h, mi) => y + m + d  + h  + mi // matched
        case _ => 0.2
    }

    return 0
}






