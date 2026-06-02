/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a09_02

  @Level:         1

  @Assertion: 10.2.4(9)
              The return type must be of type Unit.

  @Description: Check that non-Unit type of set form of index access operator causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class C {
    operator func[](index: Int64, value!: Int64): Int64 {
        42
    }
}

main() {}

