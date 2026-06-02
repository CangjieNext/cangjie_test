/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a04_02

  @Level:         1

  @Assertion: 10.2.4(4)
              No other named arguments are allowed.

  @Description: Check that additional named argument in index operator causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class C {
    operator func[](index: Int64, value!: Int64, helperValue!: Int64) {}
}

main() {}

