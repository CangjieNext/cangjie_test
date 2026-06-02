/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a05_01

  @Level:         1

  @Assertion:       5.3.3(5) If trailing lambda does not contain parameters, => can be omitted. 

  @Description:     Check that => can be ommited when lambda does not contain parameters.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func myFunc0(a: Int64, fn: ()->Int64) { fn() } 
    func myFunc1(fn: ()->Int64) { fn() } 
}

struct myStruct {
    func myFunc0(a: Int64, fn: ()->Int64) { fn() } 
    func myFunc1(fn: ()->Int64) { fn() } 
}

enum myEnum {
    T

    func myFunc0(a: Int64, fn: ()->Int64) { fn() } 
    func myFunc1(fn: ()->Int64) { fn() } 
}

func myFunc0(a: Int64, fn: ()->Int64) { fn() } 
func myFunc1(fn: ()->Int64) { fn() } 

main() {
    Assert.equals(28, myFunc1(){ 24 + 4 })
    Assert.isTrue(myFunc1 is (()->Int64) -> Int64)
    Assert.equals(28, myFunc0(12){ 24 + 4 })
    Assert.isTrue(myFunc0 is (Int64, ()->Int64) -> Int64)

    var myClassImpl = myClass()
    Assert.equals(20, myClassImpl.myFunc1{ 24 - 4 })
    Assert.equals(20, myClassImpl.myFunc1(){ 24 - 4 })
    Assert.isTrue(myClassImpl.myFunc1 is (()->Int64) -> Int64)
    Assert.equals(20, myClassImpl.myFunc0(12){ 24 - 4 })
    Assert.isTrue(myClassImpl.myFunc0 is (Int64, ()->Int64) -> Int64)

    var myStructImpl = myStruct()
    Assert.equals(1, myStructImpl.myFunc1{ 2 / 2 })
    Assert.equals(1, myStructImpl.myFunc1(){ 2 / 2 })
    Assert.isTrue(myStructImpl.myFunc1 is (()->Int64) -> Int64)
    Assert.equals(6, myStructImpl.myFunc0(12){ 24 / 4 })
    Assert.isTrue(myStructImpl.myFunc0 is (Int64, ()->Int64) -> Int64)

    Assert.equals(7, myEnum.T.myFunc1(){ 7 })
    Assert.equals(-12, myEnum.T.myFunc1{ -12 })
    Assert.isTrue(myEnum.T.myFunc1 is (()->Int64) -> Int64)
    Assert.equals(8, myEnum.T.myFunc0(12){ 2 * 4 })
    Assert.isTrue(myEnum.T.myFunc0 is (Int64, ()->Int64) -> Int64)
    
}
