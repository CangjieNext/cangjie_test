
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a03_08

  @Level:         1

  @Assertion:   16.1(3) Therefore, const variables can only be of types that are supported by const expressions.
  @Description: Checks that const variable cannot have Range type.
  @Mode: compileonly
  @Negative: yes
  @Structure: complex-main
  @Dependencies: aux_a03.cj
  @CompileWarning: no
  @Issue: 6614

*/

main() {
    const r : Range<Int64> = nothing()
}
