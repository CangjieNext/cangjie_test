/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a07_01

  @Level:         1

  @Assertion:    12.1.1(7) Each catch block starts with the keyword catch, followed by a (catchPattern) and a block
                           of expressions and declarations.

  @Description:  Checks that the catch-blocks can contain any expressions and declarations.

  @Mode:         compileonly         

  @Negative:     no

  @Structure:    single

*/

open class E1 <: Exception {}
open class E2 <: Exception {}
open class E3 <: Exception {}
open class E4 <: Exception {}
open class E5 <: Exception {}
main() {
// test case #1
    try {
    } catch(e: E1) {
      let e1 : Exception = E1()
    } catch(e: E2) {
      let e2 : Exception = E2()
    }
// test case #2
    try {
    } catch (e: E3 | E4 | E5) {
        if (e is E3) {
            let e3 : Exception = E3()
        } else if (e is E2) {
            let e4 : Exception = E4()
        } else if (e is E3) {
            let e5 : Exception = E5()
        }
    }
// test case #3
    try {
    } catch (e: Exception) {
        let except : Bool = e is Exception
    }
// test case #4
    try {
    } catch (_) {
        let execp : Exception = Exception()
    }
}
