/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a25_08

  @Level:         1

  @Assertion:   6.1.2.2(25) •Neither instance member variables nor static member variables that have not been
                initialized can be used in a static initializer;
  @Description: Checks that setting values of instance member variables is not allowed in the struct static
                initializer.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

struct S {
    var x : Int64

    static init() {
        x = 1
    }
}

main() { }
