/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      02_01_05_a01_01

  @Level:         1

  @Assertion: 2.1.5(1)
              The Nothing type is a special type that does not contain any value, and it is the subtype of all types.
              The Nothing type usually implies dead code.

  @Description: Check usages of expressions of Nothing type.

  @Mode: run

  @Negative: no
  
  @CompileWarning: Ignore

  @Comment: The only expressions which have Nothing type are: break, continue, return and throw.

*/

import utils.assert.Assert

func testBreak() {
    var res = 0
    for (x in [1, 2, 3, 4, 5]) {
        if (x == 5) {
            res = 1
            break
        }
        res = 2
    }
    res
}

func testContinue() {
    var res = 0
    for (x in [1, 2, 3, 4, 5]) {
        if (x >= 2) {
            continue
        }

        res = x
    }
    res
}

func testReturn() {
    var res = 0
    for (x in [1, 2, 3, 4, 5]) {
        if (x == 2) {
            return res
        }
        res = x
    }
    return res
}

func testThrow() {
    var res = 0
    try {
        throw Exception("nobody expects the spanish inquisition!")
        res = 2
    } catch (e: Exception) {
        res = 1
    }
    res
}

main() {
    Assert.equals(1, testBreak())
    Assert.equals(1, testContinue())
    Assert.equals(1, testReturn())
    Assert.equals(1, testThrow())
}

