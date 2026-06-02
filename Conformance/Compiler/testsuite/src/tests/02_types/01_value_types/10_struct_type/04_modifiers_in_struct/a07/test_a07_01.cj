/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_04_a07_01

  @Level:         1
  @Assertion:       2.1.10.4(7) Members modified with public are visible both inside and outside the struct definition
                    and can be accessed outside struct in the form of structInstance.varName and
                    structInstance.funcName(arguments) (structInstance denotes an instance of struct), respectively.

  @Description:     Check that public struct members are visible inside the struct definition, inside the package, and
                    in another package.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       complex-main
  @Dependencies:    aux_test_a07_01.cj
  @CompileWarning:  no

*/

import p1.*

import utils.assert.Assert

main() {
    Assert.equals(6, AuxTestA0701.statV)
    Assert.equals(1, AuxTestA0701(1).v)
    Assert.equals(7, AuxTestA0701.statP)
    Assert.equals(8, AuxTestA0701.statF())
    Assert.equals(0, AuxTestA0701.statT<Nothing>())
    Assert.equals(2, AuxTestA0701(1).p)
    Assert.equals(3, AuxTestA0701(1).f())
    Assert.equals(4, AuxTestA0701(1).t<Nothing>())
    Assert.equals(5, AuxTestA0701(1) - 5)
    test()
}
