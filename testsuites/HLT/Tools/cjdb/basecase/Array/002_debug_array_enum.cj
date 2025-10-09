/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */





enum TimeUnit1 {
    a | b | c
}

enum TimeUnit2 {
    | Year(Int8)
    | Month(Int32, Int64)
    | Day(UInt8, UInt16, UInt32)
}

var top_enum1 = TimeUnit1.a
var top_enum2 = b

var arrayTopEnum01 : Array<TimeUnit1> = [top_enum1, top_enum2]

main() {
    var time1 = top_enum1
    var time2 = c


    var time3 = TimeUnit2.Year(19)
    var time4 = TimeUnit2.Month(1, 2)
    var time5 = Day(1, 2, 3)

    var arrayMainEnum01 : Array<TimeUnit1> = [top_enum1, time1, time2]
    var arrayMainEnum02 : Array<TimeUnit2> = [time3, time4, time5]

    var slicing1 = arrayMainEnum01[2..]
    var Functioncall001: Int8 = demofun001()
    return 0
}

func demofun001(): Int8 {
    var arrayfun  = arrayTopEnum01.clone()
    var funstr1 = a
    var funstr2 = b
    var arrayfunenum01 : Array<TimeUnit1> = [funstr1, funstr2]
    var a_enum = arrayfunenum01[0]
    arrayfunenum01[0] = funstr2
    var b_enum = arrayfunenum01[0]
    return 2
}





