/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





enum TimeUnit{
    | Year(Int32)
    | Month(Int32, Float32)
    | Day(Int32, Float32, Float32)
    | Hour(Int32, Float32, Float32, Float32)
    | Twounit(TimeUnit, TimeUnit)
}

enum E1 {
    A | B(E2)
}
enum E2 {
    C(E1) | D(TimeUnit)
}

main() {

    let time1 = TimeUnit.Year(3)
    let howManyYears: Int32 = match (time1) {
        case Year(x) => 365 * x // matched
        case _ => 0
    }

    let time2 = TimeUnit.Twounit(TimeUnit.Year(3), TimeUnit.Year(3))
    let howManyYears1: Int32 = match (time2) {
        case Twounit(Year(x), Year(y)) => x + y // matched
        case _ => 0
    }
    var time3 = E1.B(E2.C(E1.B(E2.D(TimeUnit.Year(3)))))
    let howManyYears2: Int32 = match (time3) {
        case B(C(B(D(Year(x))))) => x * x // matched
        case _ => 0
    }
    return 0
}






