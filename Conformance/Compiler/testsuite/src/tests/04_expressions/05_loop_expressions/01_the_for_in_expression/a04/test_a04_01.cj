/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a04_01

  @Level:         1

  @Assertion: 4.5.1(4) In the above syntax definition, the keyword for can only be followed by
              patterns that must or may be irrefutable (see Classification of Patterns).
  @Description: Checks that pattern can not be constant pattern which is always refutable
  @Mode: compileonly
  @Negative: yes

*/

main() {
    for (12 in [12]) { println("wrong") }
}
