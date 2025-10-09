/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




enum TimeUnit {
    | Year(Int8)
    | Month(Int32, Int64)
}

let timetop = TimeUnit.Year(5)


main() {
    let timemain = timetop
    var howManyYears: Int8 = match (timetop) {
        case Year(x) => x * 24 // matched
        case _ => 0
    }


    return 0
}






