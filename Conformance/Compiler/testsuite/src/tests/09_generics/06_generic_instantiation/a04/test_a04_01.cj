/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_a04_01

  @Level:         1

  @Assertion: 9.6(4) When < and > are used, they will be parsed as generic operator. If the process succeed, it will be
              parsed as a generic expression. If parsing failed, it will parsed as a comparing expression.

  @Description: Check that < and > are parsed as generic operator where possible.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func id<T>(x: T): T {
    return x
}

main() {
    // < and > is used as generic operator
    Assert.isTrue(id<String>("hello world") is String)

    // < and > is used as compare operator
    let value = 5
    Assert.isTrue(3 < value && 7 > value)
}

