/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


 
import std.collection.*
 
public class class01 { // Object
    let width: Int64
    let height: Int64
    var name = "rectangle"
    var arrayInt01 : Array<Int16> = [161, 162]
    var arraylist01 :ArrayList<Int64> = ArrayList<Int64>([95, 1, 2,5684443])
    var vara = VArray<Int64, $3>({i=>i})       //constructor function
    let ltupleuint:(UInt8, UInt16, UInt32, UInt64, UIntNative) = (1,2,3,4,5)
    let Hashmap01 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let hashset01 = HashSet<Int64>([0, 1, 2])
 
    public init(height: Int64) {
        var b:VArray<Int64, $3> = [1, 2, 3]
        var width2: Int64 = 20
        this.width = width2     // expr this.width
        this.height = height
    }
 
    public func area() : Int64{
        width * height
    }
}
 
main() {
   var classvar01=class01(2)
   var  intvar01:Int64=10
   return 1
}
