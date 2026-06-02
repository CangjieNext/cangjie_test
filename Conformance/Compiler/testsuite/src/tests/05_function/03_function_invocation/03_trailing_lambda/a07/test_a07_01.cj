/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_03_a07_01

  @Level:         1

  @Assertion:       5.3.3(7) Note that the trailing closure syntax can only be used on function calls with 
                    function/variable names, and that the lambda expression of a trailing closure will only be 
                    interpreted as the last argument of the function corresponding to the function/variable name.

  @Description:     Check that the trailing closure syntax can only be used on function calls with function/variable 
                    names.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func myFunc0(fn: ()->Int64) { fn() } 
    func myFunc1(a: Int64, fn: (Int64)->Int64) { fn(a) } 
}

struct myStruct {
    func myFunc0(fn: ()->Int64) { fn() } 
    func myFunc1(a: Int64, fn: (Int64)->Int64) { fn(a) } 
}

enum myEnum {
    T

    func myFunc0(fn: ()->Int64) { fn() } 
    func myFunc1(a: Int64, fn: (Int64)->Int64) { fn(a) } 
}

func myFunc0(fn: ()->Int64) { fn() } 
func myFunc1(a: Int64, fn: (Int64)->Int64) { fn(a) } 

main() {
    let lambda0: ()->Int64 = { => 2} 
    let lambda1: (Int64)->Int64 = {a: Int64  => a + 2} 

    var vFunc0 = myFunc0
    Assert.equals(8, vFunc0({ => 2 * 4 }))
    Assert.equals(8, vFunc0(){ => 2 * 4 })
    Assert.equals(2, myFunc0(lambda0))
    Assert.equals(2, vFunc0(lambda0))

    var vFunc1 = myFunc1
    Assert.equals(1, vFunc1(1, { i => i * i }))
    Assert.equals(1, vFunc1(1){ i => i * i })
    Assert.equals(3, vFunc1(1, lambda1))
    Assert.equals(3, myFunc1(1, lambda1))

    var myClassImpl = myClass()
    vFunc0 = myClassImpl.myFunc0
    vFunc1 = myClassImpl.myFunc1
    Assert.equals(-2, vFunc0({ => 2 - 4 }))
    Assert.equals(-2, vFunc0(){ => 2 - 4 })
    Assert.equals(2, myClassImpl.myFunc0(lambda0))
    Assert.equals(2, vFunc0(lambda0))
    Assert.equals(2, vFunc1(1, { i => i + i }))
    Assert.equals(2, vFunc1(1){ i => i + i })
    Assert.equals(6, vFunc1(4, lambda1))
    Assert.equals(6, myClassImpl.myFunc1(4, lambda1))

    var myStructImpl = myStruct()
    vFunc0 = myStructImpl.myFunc0
    vFunc1 = myStructImpl.myFunc1
    Assert.equals(-2, vFunc0({ => 2 - 4 }))
    Assert.equals(-2, vFunc0(){ => 2 - 4 })
    Assert.equals(2, myStructImpl.myFunc0(lambda0))
    Assert.equals(2, vFunc0(lambda0))
    Assert.equals(2, vFunc1(1, { i => i + i }))
    Assert.equals(2, vFunc1(1){ i => i + i })
    Assert.equals(6, vFunc1(4, lambda1))
    Assert.equals(6, myStructImpl.myFunc1(4, lambda1))

    vFunc0 = myEnum.T.myFunc0
    vFunc1 = myEnum.T.myFunc1
    Assert.equals(-2, vFunc0({ => 2 - 4 }))
    Assert.equals(-2, vFunc0(){ => 2 - 4 })
    Assert.equals(2, myEnum.T.myFunc0(lambda0))
    Assert.equals(2, vFunc0(lambda0))
    Assert.equals(2, vFunc1(1, { i => i + i }))
    Assert.equals(2, vFunc1(1){ i => i + i })
    Assert.equals(6, myEnum.T.myFunc1(4, lambda1))
    Assert.equals(6, vFunc1(4, lambda1))

}
