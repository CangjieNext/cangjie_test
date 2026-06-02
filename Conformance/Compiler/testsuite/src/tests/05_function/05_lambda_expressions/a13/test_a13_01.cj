/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_05_a13_01

  @Level:         1

  @Assertion:       5.5(13) If the right-hand side of => is empty, the return value is ().

  @Description:     Check that if the right-hand side of => is empty, the type of return value is Unit.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    var sum1 = {a: Int32, b: Int32 => } 
}

struct myStruct {
    var sum1 = {a: Int32, b: Int32 => } 
}

enum myEnum {
    D

    func myFunc(a: Int32, b: Int32) {
        var sum1 = {a: Int32, b: Int32 => } 
        Assert.isTrue(sum1 is (Int32, Int32) -> Unit)
        0
    }
}
func myFunc(a: Int32, b: Int32) {
    var sum1 = {a: Int32, b: Int32 => } 
    Assert.isTrue(sum1 is (Int32, Int32) -> Unit)
    0
}


main() {
    var sum1 = {a: Int32, b: Int32 => } 
    Assert.isTrue(sum1 is (Int32, Int32) -> Unit)

    myFunc(12,5)

    var myClassImpl = myClass()
    Assert.isTrue(myClassImpl.sum1 is (Int32, Int32) -> Unit)

    var myStructImpl = myStruct()
    Assert.isTrue(myStructImpl.sum1 is (Int32, Int32) -> Unit)

    myEnum.D.myFunc(12,5)
}
