// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public enum test_RGBColor {
    | Red | Blue | Yellow
    | Red(UInt8) | Green(UInt8) |
     Yellow(Int8,Int16,Int64,UInt8,Float16,Float32,Float64,Bool,Rune,String,UInt8,test_RGBColor,Int64) |
     Yellow_2(Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8,Int8) |
    Yellow_3(String,Array<Int64>,(Int64,String),Unit,Range<Int64>,test_RGBColor)
}

class Cls{
    var memberS: String
    init() {
        memberS = "V50"
    }
}

var globalV = [5,56,7,8,9]
var gv = 60

func foo(param!: (Int64, Cls) = (50,Cls())) {
    var a = 10
}

func goo(param!: (Int64, Int64) = (gv,globalV[3])) {
    var a = 10
}

func woo(param!: (Int64, (Int64, Int64), Array<Int64>) = (gv, (gv,globalV[3]), [1,2,3])) {
    var a = 10
}

func roo(para_2!:Array<Int64>=[1,2]){
    var a = 10
}

func too(para_2!:test_RGBColor=Yellow(1,2,3,4,1.1,1.2,1.3,true,r'c',"CC",10,Red,10)){
    return 0
}

func yoo(para_2!:Range<Int64>=0..5:1){
        return 0
}

func uoo(para_2!:String="仓颉test"){
        return 0
}


func zoo(para_2!:CString = unsafe {LibC.mallocCString("hello")}) :Unit{
    var a = 10
}

main(){
    var a = foo()
    var b = goo()
    var c = woo()
    var d = roo()
    var e = too()
    var f = yoo()
    var g = uoo()
    var h = zoo()
    0
}
