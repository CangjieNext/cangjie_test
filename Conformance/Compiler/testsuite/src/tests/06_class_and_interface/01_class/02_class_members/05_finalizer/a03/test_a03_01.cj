/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_05_a03_01

  @Level:         1
  @Assertion: 6.1.2.5(3) A finalizer has the following dedicated syntax.
              classFinalizer
                  : '~' 'init' '(' ')' block
                  ;

  @Description: Check the simple finalizer is working
  @Mode: run
  @Negative: no
  @Structure: single

*/

var counter = 1
class C1 {
    ~init() {
        counter--
    }
}

main() {
    if (true) {
        let c1 = C1()
    } // Finalizer shoud be called after this statement if it is supported.
    return 0
}
