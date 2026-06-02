
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a10_15

  @Level:         1

  @Assertion:   16.1(10) const variables cannot be defined in extensions.
  @Description: Checks that const variables cannot be defined in a multiple interface extension of a generic class.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

interface I1 { }

interface I2 { }

class G<T> { }

extend G<T> <: I1 & I2 {
    const a = 0
}

main() { }
