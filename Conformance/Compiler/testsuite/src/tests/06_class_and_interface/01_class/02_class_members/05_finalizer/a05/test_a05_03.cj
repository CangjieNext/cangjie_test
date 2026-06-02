

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_05_a05_03

  @Level:         1

  @Assertion:   6.1.2.5(5)  2.The class with finalizer can not be qualified by open, only non-class can have
                finalizer.
  @Description: Checks that class with finalizer cannot be abstract open.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

abstract class C {
    ~init() { }
}

main() { }
