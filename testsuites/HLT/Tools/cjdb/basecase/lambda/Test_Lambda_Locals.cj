/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*
struct Rectt{
    static let degree: Int64
    static let age: Int64=10
    var boo:Bool=true
    var boo1:Bool=false
    let aa=1
    static init() {
        degree = 180
    }
}
class Student{
    var name:String="cangjie"
    var age:Int8 = 10

}
var rrtt=Rectt()
enum TimeUnit2 {
    | Year(Int8)
    | Month(Int32, Int64)
    | Day(UInt8, UInt16, UInt32)
    | Hour(UInt64, Int16, Float32, Float64)
    | Minu(Float32, Float32, Float32, Float32, Float32)
}
main(){
    let arr011 = [0, 1, 2]
    var str = "hello cangjie"
    let hss = HashSet<Int64>([0, 1, 2])
    var ArrayList1:ArrayList<Int64> = ArrayList<Int64>([1,2,3])
    var HashMap1:HashMap<String, Int64> = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    var stu = Student()
    var test_lambda =
            {
            str01:String,
            intx8:Int8,
            intx16:Int16,
            intx32:Int32,
            intx64:Int64,
            intxn:IntNative,
            uintx8:UInt8,
            uintx16:UInt16,
            uintx32:UInt32,
            uintx64:UInt64,
            uintxn:UIntNative,
            floatx16:Float16,
            floatx32:Float32,
            floatx64:Float64,
            boola: Bool,
            chara: Rune,
            varr: VArray<Int64, $3>,
            a011: VArray<Bool, $3>,
            tuple1:(Int8, Int8, Int8),
            hs:HashSet<Int64>,
            cc:Array<Int64>,
            al:ArrayList<Int64>,
            HashMap1:HashMap<String, Int64>,
            vrr:Rectt,
            stu:Student,
            enum_time:TimeUnit2
                    =>
            var rr=Rectt()
            var rrr=Rectt.age
            var c:Int64 = 3
            print("${str01}\n")
            print(hs)
            }("test lambda\n",8,16,32,64,10,8,16,32,64,10,12.12,32.32323232,64.64646464,true,r'a',[1, 2, 3],[true, false, true],(1,2,3),hss,arr011,ArrayList1,HashMap1,rrtt,stu,TimeUnit2.Year(19))
    return 0
}
