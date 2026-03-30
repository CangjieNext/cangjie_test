/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
/* SCAN


*/

import std.collection.*

const v1 = 0 as Int16
const v2 = 0 as Int32
const v3 = 0 as Int64

const v4 = 0.0 as Int16
const v5 = 0.0 as Int32
const v6 = 0.0 as Int64
const v7 = 0.0 as Float32
const v8 = 0.0 as Float64

const v9 = 1 as Int16
const v10 = 1 as Int32
const v11 = 1 as Int64

const v12 = 0i32 as Int64
const v13 = 0i32 as Int32


const v14 = "a" as Int64

const v15 = 1 as String
const v16 = 1 as ArrayList<Int32>
const v17 = "a" as String
const v18 = true as String
const v19 = [1,2,3] as String
const v20 = [1,2,3] as ArrayList<Int32>
const v21 = [1,2,3] as ArrayList<Int64>


open class Base{
    var name:String = "Alice"
}


class Derived2 <: Base{
    var gender:String = "female"
}

class Derived1 <: Base{
    var age:UInt8 = 18
}

const func f5(v:??Int32,p:(Int32)->Bool){
    match(v){
        case Some(v) =>
        match(v){
            case Some(v) where p(v) => 0
            case_ => 1
        }
         case_ => 1
    }

}
const cv= 0 as Int32
const a5 = f5(Some(cv),{x=> x%2==0})


const func f51(v:??Int64,p:(Int64)->Bool){
    match(v){
        case Some(v) =>
        match(v){
            case Some(v) where p(v) => 0
            case_ => 1
        }
         case_ => 1
    }

}
const cv1= 0 as Int64
const a51 = f51(Some(cv1),{x=> x%2==0})


const func f52(v:??Int8,p:(Int8)->Bool){
    match(v){
        case Some(v) =>
        match(v){
            case Some(v) where p(v) => 0
            case_ => 1
        }
         case_ => 1
    }

}
const cv2= 0 as Int8
const a52 = f52(Some(cv2),{x=> x%2==0})


main() {
    let base1:Base = Base()
    let base2:Base = Derived1()
    let base3:Base = Derived2()

    let derived1:Derived1 = Derived1()
    let derived2:Derived2 = Derived2()

    let castopt1= base1 as Base
    let castopt2= base1 as Derived1 
    let castopt3= derived1 as Base
    let castopt4= derived1 as Derived1
    let castopt5= derived1 as Derived2
    let castopt6= Derived2 as Derived1
    let castopt7= Derived2 as Base
    let castopt8= Derived2 as Derived2

    println(a5)
    println(a51)
    println(a52)
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
