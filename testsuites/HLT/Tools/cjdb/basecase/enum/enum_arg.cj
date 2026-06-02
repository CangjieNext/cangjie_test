/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public enum test_RGBColor {
    | Red | Blue | Yellow
    | Red(UInt8) | Green(UInt8) |
     Yellow(Int8,Int16,Int64,UInt8,Float16,Float32,Float64,Bool,Rune,String,UInt8,test_RGBColor,Int64) |
     Yellow_2(Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8) |
    Yellow_3(String,Array<Int64>,(Int64,String),Unit,Range<Int64>,test_RGBColor)
}

public enum test_R{
      | Red | Red(test_RGBColor)
}

func returnFunc(para_1:test_RGBColor,para_2!:test_RGBColor=Yellow(1,2,3,4,1.1,1.2,1.3,true,r'c',"CC",10,Red,10)){
    return para_1
}

let global_enum = test_R.Red(test_RGBColor.Yellow)
main()
{
        let enum_1 = test_RGBColor.Red
        var enum_2 = test_R.Red
        let enum_3 = Blue
        var enum_4 = test_RGBColor.Yellow
        let enum_5 = test_R.Red(enum_4)

        var test_enum_1 = Yellow(1,2,3,4,1.1,1.2,1.3,true,r'c',"CC",10,Red,10)
        let test_enum_2 = Yellow_2(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
        var test_enum_3 = Yellow_3("测试%&……%￥#",[1,2,3],(18,"测试test"),(),0..5,test_enum_1)
        var test_enum_4 = test_R.Red(test_RGBColor.Red(10))
        let test_enum_5 = returnFunc(test_enum_3)
        var test_enum_6 = returnFunc(test_enum_1,para_2:test_RGBColor.Red)
        return 0
}
