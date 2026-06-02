/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_02_01_aux_a03_04_enum

  @Level:         1

  @Assertion:   10.1.2.1(nA) Functions in the visible set must meet the following conditions:
                10.1.2.1(3) Otherwise, if f is constructor name of a enum type,
                the visible set includes only the constructor named f in the specified enum

  @Description:  aux package with routines with name identical to enum constructor


  @Mode:         run

  @Negative:     no

  @Structure:    complex-aux

*/
package penum

import utils.assert.Assert

public func ENUMc(x: Int8) {
    Assert.fail()
}
public func ENUMc(x: Int16, y!:Int8=8i8) {
    Assert.fail()
}
public func ENUMc(x: Int32,y!:Int16=16i16, z!:Int8=8i8) {
    Assert.fail()
}
public func ENUMc(s: Int64,x!: Int32=32i32,y!:Int16=16i16, z!:Int8=8i8) {
    Assert.fail()
}
