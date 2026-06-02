
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a10_05

  @Level:         1

  @Assertion:   16.4(10) 7.The rules for overloading const functions and non-const functions are the same.
  @Description: Checks that two global const functions with the same name cannot be declared if they
                violate the overloading rules.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

const func f(x: Int64) { }

const func f(x: Int64) { }

main() { }
