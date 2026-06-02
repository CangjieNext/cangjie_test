/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_04_a02_1

  @Level:         1

  @Assertion:    1.3.4(2) It consists of a leading character b, a pair of single quotes and an ASCII character

  @Description:  Different byte literals are presented

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:

*/
import utils.assert.Assert

main() {
    Assert.equals(b'A',b'A')
    Assert.equals(b'a',b'a') 
    Assert.equals(b'0',b'0') 
    // EscapedIdentifier
    Assert.isTrue(b'\t' > b'\0') 
    Assert.isTrue(b'\b' > b'\0') 
    Assert.isTrue(b'\r' > b'\0') 
    Assert.isTrue(b'\n' > b'\0') 
    Assert.isTrue(b'\t' > b'\0') 
    Assert.isTrue(b'\\' > b'\0') 
    Assert.isTrue(b'\'' > b'\0') 
    Assert.isTrue(b'\f' > b'\0') 
    Assert.isTrue(b'\v' > b'\0') 

    Assert.isTrue(b'\u{1}'           is UInt8)
    Assert.isTrue(b'\u{12}'          is UInt8)
    return 0
}

