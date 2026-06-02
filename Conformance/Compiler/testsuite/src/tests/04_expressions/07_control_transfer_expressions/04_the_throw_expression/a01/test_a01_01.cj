
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_04_a01_01

  @Level:         1

  @Assertion:   4.7.4(1) throw expressions are used for throwing exceptions.
  @Description: Checks that throw expressions throw exceptions. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    Assert.throws({ => throw Exception() })
}
