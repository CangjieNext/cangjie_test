/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a43_07

  @Level:         1

  @Assertion: 6.1.2.1(43)
              Like any function, If no constructor of the corresponding parameter type is matched
              or no accessible constructor exists, the compiler reports an error .

  @Description: Check that if arguments do not match the type created from a generic type parameter,
                an error occurs

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A<T> {
  init(x: T) {}
}

main() {
  let x = A<Float64>(12)
}

