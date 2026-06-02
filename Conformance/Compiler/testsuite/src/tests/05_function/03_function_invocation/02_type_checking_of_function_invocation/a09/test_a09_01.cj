/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_02_a09_01

  @Level:         1

  @Comment:         Note the following: 

  @Assertion:       5.3.2(9) 1. If the function has a default value, parameters whose default values are not specified 
                    are not involved in the overload resolution.

  @Description:     Check that if some function parameter default values are not specified - such parameters are not 
                    involved in the overload resolution. 

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f0(a!: Int32 = 7): Int32 { a }
    func f0(a: Int32, b!: Int32 = 12): Int32 { a + b}
}

struct myStruct {
    func f0(a!: Int32 = 7): Int32 { a }
    func f0(a: Int32, b!: Int32 = 12): Int32 { a + b}
}

enum myEnum {
    H

    func f0(a!: Int32 = 7): Int32 { a }
    func f0(a: Int32, b!: Int32 = 12): Int32 { a + b}
}

func f0(a!: Int32 = 7): Int32 { a }
func f0(a: Int32, b!: Int32 = 12): Int32 { a + b}

main() {
    Assert.equals(7, f0())
    Assert.equals(15, f0(a: 15))
    Assert.equals(22, f0(10))
    Assert.equals(15, f0(10, b: 5))

    var myClassImpl = myClass()
    Assert.equals(7, myClassImpl.f0())
    Assert.equals(15, myClassImpl.f0(a: 15))
    Assert.equals(22, myClassImpl.f0(10))
    Assert.equals(15, myClassImpl.f0(10, b: 5))

    var myStructImpl = myStruct()
    Assert.equals(7, myStructImpl.f0())
    Assert.equals(15, myStructImpl.f0(a: 15))
    Assert.equals(22, myStructImpl.f0(10))
    Assert.equals(15, myStructImpl.f0(10, b: 5))

    Assert.equals(7, myEnum.H.f0())
    Assert.equals(15, myEnum.H.f0(a: 15))
    Assert.equals(22, myEnum.H.f0(10))
    Assert.equals(15, myEnum.H.f0(10, b: 5))

}
