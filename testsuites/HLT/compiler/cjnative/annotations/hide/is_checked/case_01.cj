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
import std.fs.*
import std.math.*


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
    let castopt6= derived2 is Derived1
    let castopt7= derived2 is Base
    let castopt8= derived2 is Derived2

@Test
class MyTest{
    @TestCase
    func testCase0(): Unit{
        @Expect(v1, false)
        @Expect(v2, false)
        @Expect(v3)
        @Expect(v4, false)
        @Expect(v5, false)
        @Expect(v6, false)
        @Expect(v7, false)
        @Expect(v8)
        @Expect(v9, false)
        @Expect(v10, false)
        @Expect(v11)
        @Expect(v12, false)
        @Expect(v13)
        @Expect(v14, false)
        @Expect(v15, false)
        @Expect(v16, false)
        @Expect(v17)
        @Expect(v18, false)

        @Expect(castopt1)
        @Expect(castopt2, false)
        @Expect(castopt3)
        @Expect(castopt4)
        @Expect(castopt5, false)
        @Expect(castopt6, false)
        @Expect(castopt7)
        @Expect(castopt8)
  
 

    }
   
}



