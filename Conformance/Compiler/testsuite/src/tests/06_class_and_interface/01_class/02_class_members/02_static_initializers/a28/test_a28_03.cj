/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a28_03

  @Level:         1

  @Assertion:   6.1.2.2(28) •Unlike static functions, static initializers couldn’t be declared as an extension (inside
                an extend section);
  @Description: Checks that static initializer cannot be declared inside a generic class extension.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6124

*/

class G<T> { }

extend G<T> { 
    static init() { }
}

main() { }
