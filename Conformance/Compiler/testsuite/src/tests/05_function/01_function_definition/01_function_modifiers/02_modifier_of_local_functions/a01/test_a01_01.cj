/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_02_a01_01

  @Level:         1

  @Assertion:     5.1.1.2(1) No modifiers available for local functions.

  @Description:   Check that local function can not have any modifiers: local

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/
local func myLocalFunc(){""}
main() {
}
