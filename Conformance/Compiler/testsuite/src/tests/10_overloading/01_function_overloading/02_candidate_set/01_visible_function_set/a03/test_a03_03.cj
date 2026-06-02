/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_a03_03

  @Level:         1

  @Assertion:   10.1.2.1(nA) Functions in the visible set must meet the following conditions:
                10.1.2.1(3) Otherwise, if f is constructor name of a enum type,
                the visible set includes only the constructor named f in the specified enum

  @Description:  Test for constructor. Name of type and constructor are identical


  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Issue: 0006645

*/



enum ENUM {
    ENUM(Int8) | ENUM(Int16,Int8) | ENUM(Int32,Int16,Int8) | ENUM(Int64,Int32,Int16,Int8)

}

    func ENUM(x: Int8) {
        x
    }
    func ENUM(x: Int16, y!:Int8=8i8) {
        x
    }
    func ENUM(x: Int32,y!:Int16=16i16, z!:Int8=8i8) {
        x
    }
    func ENUM(s: Int64,x!: Int32=32i32,y!:Int16=16i16, z!:Int8=8i8) {
        x
    }
    


main(ina :Array<String>) {
    var kl:ENUM = ENUM(8i8);
    var kl64 = ENUM(64i64)
    let e32 = ENUM(32i32)
    let e16 = ENUM(16i16)
    0
}
