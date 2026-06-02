/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a22_04

  @Level:         1

  @Assertion:   6.1.2.2(22) •A static initializer cannot have any parameters;
  @Description: Checks that the static initializer for struct cannot have parameters.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

struct S {
    static init(x : Int64) { }
}

main() { }
