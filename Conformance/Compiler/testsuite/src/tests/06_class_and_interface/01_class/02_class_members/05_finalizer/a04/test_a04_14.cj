

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_05_a04_14

  @Level:         1

  @Assertion:   6.1.2.5(4)  1.Finalizer cannot have parameters, or return type, or generic type parameters, or any
                modifiers, and they cannot be invoked explicitly.
  @Description: Checks that finalizer cannot be redef static.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

open class A { }

class B <: A {
    redef static ~init() { }
}

main() { }
