/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a03_04

  @Level:         1

  @Assertion:   7.2(3) Abstract properties can be declared in interfaces and abstract classes,
                and these abstract properties do not require defined implementations.

  @Description: Checks that abstract property cannot be declared in extend.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

extend Int64 {
  prop s1: Int64
}

main() {
    return 0;
}


