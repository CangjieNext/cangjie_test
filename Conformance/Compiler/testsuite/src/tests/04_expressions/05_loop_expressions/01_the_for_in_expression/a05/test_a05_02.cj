/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_05_01_a05_02

  @Level:         1

  @Assertion: 4.5.1(5) At the semantic check stage, it is checked whether the pattern after for
              is actually irrefutable, if not, it is a compile-time error.
  @Description: Checks that use of refutable tuple pattern is compile error
  @Mode: compileonly
  @Negative: yes

*/

main() {
    for ((Some(x), _) in [(Some(1), 'a'), (Some(1), 'a')]) { // Option is not single parameterized constructor
    }
}
