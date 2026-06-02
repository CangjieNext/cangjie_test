
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a04_02

  @Level:         1

  @Assertion:   6.1.2.2(4) There are following rules for a static initializer: - A static initializer is called
                automatically and couldn’t be called explicitly; 
  @Description: Checks that class static initializer cannot be called explicitly.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

class C {
    static init() { }
}

main() {
    C.init()
}
