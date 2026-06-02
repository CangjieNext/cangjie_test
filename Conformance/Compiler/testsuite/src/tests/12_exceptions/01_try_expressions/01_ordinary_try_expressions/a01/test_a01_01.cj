/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a01_01

  @Level:         1

  @Assertion:    12.1.1(1) ordinary try expressions (try expressions in this section unless stated otherwise)
                           have three parts: a try block, zero or more catch blocks and an optional finally block.

  @Description:  Checks all possible variants of the ordinary try expression are compiled successfuly.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

open class E1 <:  Exception {}
open class E2 <:  Exception {}
open class E3 <:  Exception {}
main() {
// test case #1
    try {
    } catch (e: E1)  {
    } catch (e: E2)  {
    } catch (e: E3)  {}
// test case #2
    try {
    } catch (e: E1)  {}
// test case #3
    try {
    } finally  {}
// test case #4
    try {
    } catch (e: E1)  {
    } finally {}
// test case #5
    try {
    } catch (e: E1)  {
    } catch (e: E2)  {
    } catch (e: E3)  {
    } finally  {}
}

