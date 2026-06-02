
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a10_08

  @Level:         1

  @Assertion:   16.1(10) const variables cannot be defined in extensions.
  @Description: Checks that const variables cannot be defined in an interface extension of an abstract class.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

interface I { }

abstract class A { }

extend A <: I {
    const a = 0
}

main() { }
