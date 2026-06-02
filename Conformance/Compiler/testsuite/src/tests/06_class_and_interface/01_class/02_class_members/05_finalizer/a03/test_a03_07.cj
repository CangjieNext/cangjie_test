/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_05_a03_07

  @Level:         1
  @Assertion: 6.1.2.5(3) A finalizer has the following dedicated syntax.
              classFinalizer
                  : '~' 'init' '(' ')' block
                  ;

  @Description: Check the finalizer without '(' brace
  @Mode: compileOnly
  @Negative: yes
  @Structure: single

*/

class C1 {
    ~init) {}
}

main() {
    return 0
}
