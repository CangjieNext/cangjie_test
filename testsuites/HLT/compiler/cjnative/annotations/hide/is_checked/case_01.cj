/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args  2>&1 | compare %f
/* SCAN


*/

import std.collection.*
import std.fs.*


public class ListView<T>{
    private let _data:List<T> = ArrayList<T>()
    public func toString(){
        "${_data.toArray() as String}"
    }

}

public class ListView1<T>{
    private let _data:List<T> = ArrayList<T>()
    public func toString(){
        "${_data.toArray() is String}"
    }

}

open class Base{
    var name:String = "Alice"
}


class Derived1 <: Base{
    var age:UInt8 = 18
}

class Derived2 <: Base{
    var gender:String = "female"
}

const v1 = 0 is Int16
const v2 = 0 is Int32
const v3 = 0 is Int64

const v4 = 0.0 is Int16
const v5 = 0.0 is Int32
const v6 = 0.0 is Int64
const v7 = 0.0 is Float32
const v8 = 0.0 is Float64

const v9 = 1 is Int16
const v10 = 1 is Int32
const v11 = 1 is Int64

const v12 = 0i32 is Int64
const v13 = 0i32 is Int32


const v14 = "a" is Int64

const v15 = 1 is String
const v16 = 1 is ArrayList<Int32>
const v17 = "a" is String
const v18 = true is String
const v19 = [1,2,3] is String
const v20 = [1,2,3] is ArrayList<Int32>
const v21 = [1,2,3] is ArrayList<Int64>



main() {
    let base1:Base = Base()
    let base2:Base = Derived1()
    let base3:Base = Derived2()

    let derived1:Derived1 = Derived1()
    let derived2:Derived2 = Derived2()

    let castopt1= base1 is Base
    let castopt2= base1 is Derived1 
    let castopt3= derived1 is Base
    let castopt4= derived1 is Derived1
    let castopt5= derived1 is Derived2
    let castopt6= Derived2 is Derived1
    let castopt7= Derived2 is Base
    let castopt8= Derived2 is Derived2

    println(v1)
    println(v2)
    println(v3)
    println(v4)
    println(v5)
    println(v6)
    println(v7)
    println(v8)
    println(v9)
    println(v10)
    println(v11)
    println(v12)
    println(v13)
    println(v14)
    println(v15)
    println(v16)
    println(v17)
    println(v18)
    println(v19)
    println(v20)
    println(v21)
    println(castopt1)
    println(castopt2)
    println(castopt3)
    println(castopt4)
    println(castopt5) 
    println(castopt6) 
    println(castopt7) 
    println(castopt8) 
}
