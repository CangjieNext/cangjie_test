
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_03_a08_01

  @Level:         1

  @Assertion:   4.7.3(8) A return expression of the form return is regarded as the syntactic sugar of return (). 
  @Description: Checks that `return` returns Unit, namely (). 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func f() { return }

main() {
    Assert.isTrue(f is () -> Unit)
    Assert.isTrue(f() is Unit)
    Assert.isTrue(() == f())
}
