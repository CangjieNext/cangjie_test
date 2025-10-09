/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




enum TimeUnit1 {
    | Year
    | Year(Int32) // ok
    | Month(Int32, Int32) // ok
    | Month(Int32) // ok
    | Day(Int32, Float16, Float32) // ok
    | Day(Float32, Float32) // ok
    | Hour(Bool, Rune, Int32, Float32) // ok
    | Hour(Int32, Int32, Int32) // ok
}

main() {
    let time1 = Year
    let time2 = TimeUnit1.Month(1, 2)
    let howManyMonths: Int32 = match (time2) {
        case Month(x, y) => x + y // matched
        case Month(x) => x
        case _ => 0
    }
    let time3 = Month(2)
    let howManyMonths1: Int32 = match (time3) {
        case Month(x, y) => x + y
        case Month(x) => x // matched
        case _ => 0
    }
    let time4 = Day(1, 2.2, 3.3)
    let time5 = Hour(true, r'a', 10, 4.4)

    return 0
}






