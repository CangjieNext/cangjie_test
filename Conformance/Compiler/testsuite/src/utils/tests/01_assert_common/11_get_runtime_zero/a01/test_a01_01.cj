/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_11_a01_01
  @Assertion:       func getRuntimeZero(args: Array<String>)

  @Description:     Common use.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no
*/

import utils.assert.Assert

main(inp: Array<String>) {
    Assert.equals(0, Assert.getRuntimeZero(inp))
}
