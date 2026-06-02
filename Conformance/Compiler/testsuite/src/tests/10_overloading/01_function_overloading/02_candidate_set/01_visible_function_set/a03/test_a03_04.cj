/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a03_04

  @Level:         1

  @Assertion:   10.1.2.1(nA) Functions in the visible set must meet the following conditions:
                10.1.2.1(3) Otherwise, if f is constructor name of a enum type,
                the visible set includes only the constructor named f in the specified enum

  @Description:  Test for constructor. Overloading enum constructor
                 There is conflict with package routine names and constructor names 

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a03_04_enum.cj

  @Issue: 0006645

*/


import utils.assert.Assert

import penum.*

enum ENUM {
    ENUMc(Int8) | ENUMc(Int16,Int8) | ENUMc(Int32,Int16,Int8) | ENUMc(Int64,Int32,Int16,Int8)

}

func ENUMc(x: Int8) {
    Assert.equals(8i8, x)
    x
}
func ENUMc(x: Int16, y!:Int8=8i8) {
    Assert.equals(16i16, x)
    x
}
func ENUMc(x: Int32,y!:Int16=16i16, z!:Int8=8i8) {
    Assert.equals(32i32, x)
    x
}
func ENUMc(s: Int64,x!: Int32=32i32,y!:Int16=16i16, z!:Int8=8i8) {
    Assert.equals(64i64, s)
    x
}



main(ina :Array<String>) {
    var kl:ENUM = ENUMc(8i8);
    var kl64 = ENUMc(64i64)
    let e32 = ENUMc(32i32)
    let e16 = ENUMc(16i16)
    Assert.isTrue(kl is ENUM)
    0
}
