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
    Yellow_3(String,Array<Int64>,(Int64,String),Unit,Range<Int64>)
}

public enum test_R{
      | Red | Red(test_RGBColor)
}


main(){
        var test_enum_1 = Yellow(1,2,3,4,1.1,1.2,1.3,true,r'c',"CC",10,Red,10)
        let test_enum_2 = Yellow_2(1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
        var test_enum_3 = Yellow_3("测试%&……%￥#",[1,2,3],(18,"测试test"),(),0..5)
        var test_enum_4 = test_R.Red(test_RGBColor.Red(10))
        return 0
}
