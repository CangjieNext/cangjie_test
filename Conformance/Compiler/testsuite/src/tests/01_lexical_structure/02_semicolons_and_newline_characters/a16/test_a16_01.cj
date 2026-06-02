/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a16_01

  @Level:         1

  @Assertion:    1.2(16) For multi-line raw string literal, the raw string literal is termintaed
                         by the first non-escaped double quotation and the same number of # characters
                         as the beginning.

  @Description:  Check whether the multi-line raw string literals is terminated correctly for different use cases.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert;
main() {
    let str = "\n1\n2\n3\n4\n5\n"
    var rawStr = #""# 

    // test case #1
    Assert.equals("", rawStr);
    rawStr = ##""## 
    Assert.equals("", rawStr);

    // test case #2
    rawStr = #"
1
2
3
4
5
"#
    Assert.equals(str, rawStr);

    // test case #3
    rawStr = ##"
1
2
3
4
5
"##
    Assert.equals(str, rawStr);

    // test case #4
    rawStr = ######"
1
2
3
4
5
"######
    Assert.equals(str, rawStr);

    // test case #5
    rawStr = ###"1 2 3 4 5


"###
    Assert.equals("1 2 3 4 5\n\n\n", rawStr);

    // test case #6
    rawStr = ###"1 2 3 4 5
\"###
    Assert.equals("1 2 3 4 5\n\\", rawStr);

    // test case #7
    rawStr = ###"1 2 3 4 5\\"###
Assert.equals("1 2 3 4 5\\\\", rawStr);
}
