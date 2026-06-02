

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_05_a06_01

  @Level:         1

  @Assertion:   6.1.2.5(6)  3.At most one Finalizer can be defined in a class.
  @Description: Checks that class cannot have two finalizers.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

class C {
    ~init() { }

    ~init() { }
}

main() { }
