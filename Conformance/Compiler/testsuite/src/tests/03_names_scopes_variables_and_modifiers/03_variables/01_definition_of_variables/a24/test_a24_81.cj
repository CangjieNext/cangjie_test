/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a24_81

  @Level:         1

  @Assertion:    3.3.1(24)  To use keywords as variable names, a pair of backticks ( `)s must be used 
                 (such as `open` and `throw`).

  @Description:  Check that variable can be defined with a pair of backticks ( `) using any identifiers, 
                 not only keywords

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

enum MyEnum {
    | enumCase1
    | enumCase2
}

class MyClass {
    var `abra_9876uu98y_cabra` = MyEnum.enumCase2
    let `alex`: Int64 = 12
    var `A1245` = r'C'

    func checkValues() {
        Assert.equals(12, this.`alex`)
        Assert.equals(r'C', this.`A1245`)
        Assert.isTrue(this.`alex` is Int64)
        Assert.isTrue(this.`A1245` is Rune)
    }
}

main() {
    var `Ayuwe9` = "Clkjaseghfh"
    Assert.equals("Clkjaseghfh", `Ayuwe9`)
    Assert.isTrue(`Ayuwe9` is String)

    var myClassImpl = MyClass()
    myClassImpl.checkValues()
}
