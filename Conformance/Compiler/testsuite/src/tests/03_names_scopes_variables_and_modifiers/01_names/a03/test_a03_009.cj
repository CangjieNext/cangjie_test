/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_01_a03_009

  @Level:         1

  @Assertion:    3.1(3) A name uniquely represents one entity in any scope. That is, entities in the same
                  scope are not allowed to have the same name, except the names that make up overloading.

  @Description:  Check that variables with different names in the same area do not cause errors

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

package a03

import utils.assert.*

interface I1 { 
    func getVarName1(): Int64
    func getVarName2(): Float64 
}

interface I2 { 
    func getVarName3(): Int16
    func getVarName4(): Float16
}

class Class <: I1 & I2 {
    var varName1 = 0
    var varName2 = .1
    var varName3: Int16 = 2
    var varName4: Float16 = .3
    var varName5: Int32 = 4
    var varName6: Float32 = .5

    public override func getVarName1() { varName1 }
    public override func getVarName2() { varName2 }
    public override func getVarName3() { varName3 }
    public override func getVarName4() { varName4 }
    func getVarName5() { varName5 }
    func getVarName6() { varName6 }
}

enum Enum {
    YEAR | MONTHS
}

struct Struct {
    let letName1: UInt64 = 0
    let letName2 = .1
    let letName3: UInt8 = UInt8(2**7)
    let letName4: Float16 = .3
    let letName5: UInt16 = UInt16(2**15)
    let letName6: Float32 = .5

    func getLetName1() { letName1 }
    func getLetName2() { letName2 }
    func getLetName3() { letName3 }
    func getLetName4() { letName4 }
    func getLetName5() { letName5 }
    func getLetName6() { letName6 }
}

main() {
    let a = 0
    let b: Int8 = 1

    Assert.isTrue(a is Int64)
    Assert.isTrue(b is Int8)

    var lambda = { =>
        { =>
            { =>
                { =>
                    { =>
                        let n = '\n'
                        let r = '\r'
                        return (n, r)
                    }()
                }()
            }()
        }()
    }()

    Assert.isTrue(lambda == ('\n','\r'))

    var clsObj = Class()

    Assert.equals(0, clsObj.getVarName1())
    Assert.equals(.1, clsObj.getVarName2())
    Assert.equals(2, clsObj.getVarName3())
    Assert.equals(.3, clsObj.getVarName4())
    Assert.equals(4, clsObj.getVarName5())
    Assert.equals(.5, clsObj.getVarName6())

    var structObj = Struct()

    Assert.equals(0, structObj.getLetName1())
    Assert.equals(.1, structObj.getLetName2())
    Assert.equals(structObj.getLetName3(), UInt8(2**7))
    Assert.equals(.3, structObj.getLetName4())
    Assert.equals(structObj.getLetName5(), UInt16(2**15))
    Assert.equals(.5, structObj.getLetName6())

    let yearObj = Enum.YEAR
    let monthsObj = Enum.MONTHS

    Assert.isTrue(yearObj is Enum)
    Assert.isTrue(monthsObj is Enum)
}