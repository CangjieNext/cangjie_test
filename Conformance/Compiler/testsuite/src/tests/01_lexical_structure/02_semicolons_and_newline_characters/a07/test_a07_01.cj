/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            01_02_a07_01

  @Level:         1

  @Assertion:       1.2(7) The following examples show the usage of the semicolon and newline character.
                    let width1: Int32 = 32 // The newline character is treated as a terminator.
                    let length1: Int32 = 1024 // The newline character is treated as a terminator.
                    let width2: Int32 = 32; let length2: Int32 = 1024 // The newline character is treated as a 
                    terminator.
                    var x = 100 + // The newline character is treated as a connector.
                    200 * 300 - // The newline character is treated as a connector.
                    50 // The newline character is treated as a terminator.

  @Description:     Examples from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

main() {
    let width1: Int32 = 32 // 
    let length1: Int32 = 1024 // 
    let width2: Int32 = 32; let length2: Int32 = 1024 // 
    var x = 100 + // 
    200 * 300 - // 
    50 //

    Assert.equals(32,width1)
    Assert.equals(1024,length1)
    Assert.equals(32,width2)
    Assert.equals(1024,length2)
    Assert.equals(60050,x)
}
