/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

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
            case _ => 1
        }
         case _ => 1
    }

}
const cv= 0 as Int32
const a5 = f5(Some(cv),{x=> x%2==0})


const func f51(v:??Int64,p:(Int64)->Bool){
    match(v){
        case Some(v) =>
        match(v){
            case Some(v) where p(v) => 0
            case _ => 1
        }
         case _ => 1
    }

}
const cv1= 0 as Int64
const a51 = f51(Some(cv1),{x=> x%2==0})


const func f52(v:??Int8,p:(Int8)->Bool){
    match(v){
        case Some(v) =>
        match(v){
            case Some(v) where p(v) => 0
            case _ => 1
        }
         case _ => 1
    }

}
const cv2= 0 as Int8
const a52 = f52(Some(cv2),{x=> x%2==0})



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
    let castopt6= derived2 as Derived1
    let castopt7= derived2 as Base
    let castopt8= derived2 as Derived2

 
@Test
class MyTest{
    @TestCase
    func testCase0(): Unit{
        @Expect(v1.isSome(), false)
        @Expect(v2.isSome(), false)
        @Expect(v3.isSome())
        @Expect(v4.isSome(), false)
        @Expect(v5.isSome(), false)
        @Expect(v6.isSome(), false)
        @Expect(v7.isSome(), false)
        @Expect(v8.isSome())
        @Expect(v9.isSome(), false)
        @Expect(v10.isSome(), false)
        @Expect(v11.isSome())
        @Expect(v12.isSome(), false)
        @Expect(v13.isSome())
        @Expect(v14.isSome(), false)
        @Expect(v15.isSome(), false)
        @Expect(v16.isSome(), false)
        @Expect(v17.isSome())
        @Expect(v18.isSome(), false)

        @Expect(castopt1.isSome())
        @Expect(castopt2.isSome(), false)
        @Expect(castopt3.isSome())
        @Expect(castopt4.isSome())
        @Expect(castopt5.isSome(), false)
        @Expect(castopt6.isSome(), false)
        @Expect(castopt7.isSome())
        @Expect(castopt8.isSome())
  
 

    }
   
}