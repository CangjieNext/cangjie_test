// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGBColor {
    | Red | Green | Blue(Int64)    
    func fBool(a:Bool) { 0 }
    func fRune(a:Rune) { 0 }
    func fUnit(a:Unit) { 0 }  
    func fstring(a:String ) { 0 }
    func ftuple(a:(Float64, String )) { 0 }
    func frange(a:Range<Int64>) { 0 }
    func fArray(a:Array<Int64>) { 0 }
    func fVArray(a:VArray<Int64, $5>) { 0 }
    func f6(a:Int64, b:Int32, c:Float64, d:Float32, e:Bool) { 0 }
} 
var a1 = RGBColor.Red

main(){
    a1.fBool 
    0
}