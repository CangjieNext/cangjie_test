/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_02_a03_01

  @Level:         1

  @Assertion:   7.2(3) Abstract properties can be declared in interfaces and abstract classes,
                and these abstract properties do not require defined implementations.

  @Description: Checks that abstract property can be declared in interface and abstract class.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124


*/

interface I {
  prop i1: Int64
  mut prop i2: Int64
}

abstract class C {
  public prop c1: Int64
  public mut prop c2: Int64
  protected prop c3: Int64
  protected mut prop c4: Int64
}

main() {
    return 0;
}


