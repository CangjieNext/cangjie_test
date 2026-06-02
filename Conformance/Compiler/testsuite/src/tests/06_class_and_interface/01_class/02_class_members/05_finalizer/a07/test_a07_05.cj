

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_05_a07_05

  @Level:         1

  @Assertion:   6.1.2.5(7) 4.Finalizer can not be defined in extensions.
  @Description: Checks that extension of a struct cannot have a finalizer.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

struct S { }

extend S {
    ~init() { }
}

main() { }
