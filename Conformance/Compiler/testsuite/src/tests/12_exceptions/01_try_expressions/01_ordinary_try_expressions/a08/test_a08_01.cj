/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a08_01

  @Level:         1

  @Assertion:    12.1.1(8) The catchPattern matches the exception to be caught by pattern matching, and if the match
                           is successful,it is passed to  the block of expressions and declarations for processing,
                           and all subsequent catch block are ignored.

  @Description:  Checks that only catch-block which matches pattern for the thrown exception executes
                 and all the others are ignored.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
open class E1 <: Exception {}
open class E2 <: Exception {}
open class E3 <: Exception {}
open class E4 <: Exception {}
open class E5 <: Exception {}
main() {
    var r : Bool = false
// test case #1
    try {
        throw E3()
    } catch (e: E1) {
        Assert.fail()
    } catch (e: E2) {
        Assert.fail()
    } catch (e: E3) {
        r = true
    } catch (e: E4) {
        Assert.fail()
    } catch (e: E5) {
        Assert.fail()
    }
    Assert.equals(true, r)
// test case #2
    r = false
    try {
        throw E3()
    } catch (e: E1 | E2 | E4 | E5) {
        Assert.fail()
    } catch (e: E3) {
        r = true
    }
    Assert.equals(true, r)
}
