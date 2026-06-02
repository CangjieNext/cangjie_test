/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_04_01_02_a03_01

  @Level:         1
  @Assertion:    3.4.1.2(3)
                class A {
                    private var v = 0
                }
                let b = A().v // error


  @Description: Tests example from the spec

  @Mode:         compileonly
  @Negative:     yes
  @Structure:    single

*/

class A {
    private var v = 0
}
let b = A().v // error

main() {
}
