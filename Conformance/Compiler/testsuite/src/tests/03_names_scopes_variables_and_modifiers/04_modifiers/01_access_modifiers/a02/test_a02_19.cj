/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_01_a02_19

  @Level:         1

  @Assertion:    3.4.1(2) Cangjie supports 4 different kinds of access rights.

  @Description:  Check that using a non-existent modifier causes an error
  
  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

class A {
    ekfha var b = 1
}

main() {
    A().b = 0
}
