/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

macro package define

import std.ast.*

public macro M_func(args: Tokens){
    return quote(

    )
}


public macro M_class(args: Tokens){
    return quote(
        $args
        var vm_1:Int8 = claIns1.tuple_I[0] //(Int8):-8
        var vm_2:Int16 = claIns1.tuple_I[1] //(Int16):16
        var vm_3:Int32 = claIns1.tuple_I[2] //(Int32):-32
        let vm_4:Int64 = claIns1.tuple_I[3] //(Int64):64

        let vm_5:UInt8 = claIns1.tuple_UI[0] //(UInt8):8
        var vm_6:UInt16 = claIns1.tuple_UI[1] //(UInt16):165
        var vm_7:UInt32 = claIns1.tuple_UI[2] //(UInt32):3206
        let vm_8:UInt64 = claIns1.tuple_UI[3] //(UInt64):64521

        let vm_9:Float32 = claIns1.tuple_F[0] //(Float32):32.32
        var vm_10:Float64 = claIns1.tuple_F[1] //(Float64):64.64

        var vm_11:Bool = claIns1.tuple_O[0] //(Bool):true
        let vm_12:Rune = claIns1.tuple_O[1] //(Rune):'C'
        var vm_13:Float16 = 1.016 //(Float16):1.016
    )
}

public macro M_struct(args: Tokens){
    return quote(
        $args
        r.width = 8
        r.height = 24
        let r_area = r.area()
    )
}

public macro M_enum(args: Tokens){
    return quote(
        var time_Year:TimeUnit<Int64,Int32> = TimeUnit.Year(2021)
        var time_Month:TimeUnit<Int64,Int32> = TimeUnit.Month(2021,9)
        var time_Day:TimeUnit<Int64,Int32> = TimeUnit.Day(2021,9,22)
    )
}
