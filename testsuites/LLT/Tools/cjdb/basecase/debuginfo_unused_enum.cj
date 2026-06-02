// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public enum test_RGBColor {
    | Red | Blue | Yellow
    | Red(UInt8) | Green(UInt8) | Yellow(Int8,Int16,Int64,UInt8,Float16,Float32,Float64,Bool,Rune,String)
}
 
func AAA(BBB:test_RGBColor,CCC:test_RGBColor){
    return 0
}
 
main(){
    let enum_001 = Blue
    let enum_002 = Yellow(10,20,30,40,1.0,2.0,3.0,true,r'C',"AoLiGei")
    let enum_003 = AAA(enum_001, enum_002)
}
