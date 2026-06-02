
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a10_01

  @Level:         1

  @Assertion:   16.2(10) 8.if, match, try, control transfer expressions (including return, break, continue, throw),
                is, as. 
  @Description: Check that if, match, try, control transfer expressions (including return, break, continue, throw),
                is, as expressions are const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore
  @Issue: 6614

*/

import utils.assert.Assert

main() {
    const c = 1
    const cIf = if (c > 0) { }
    const cIfElse = if (c > 0) {
        c
    } else {
        c + 1
    }
    const cIfElseIf = if (c == 0) {
        c
    } else if (c > 0) {
        c + 1
    } else {
        c + 2
    }
    Assert.equals(cIf, ())
    Assert.equals(cIfElse, 1)
    Assert.equals(cIfElseIf, 2)

    const cMatch1 = match(2) {
        case 1 | 3 => 1
        case _ => 2
    }
    const tup = (1, "2", cMatch1)
    const cMatch2 = match(tup) {
        case (x, "1", y) => 1
        case (1, "2", y) where false => 2
        case (x, y, z) => 3
    }

    Assert.equals(cMatch1, 2)
    Assert.equals(cMatch2, 3)

    const cTry = try {
        const cThrow = "throw"
    } catch (_) { 
    } finally {
    }

    const func fr1() {
        return 1
    }
    Assert.equals(fr1(), 1)

    const cIs = Some(1) is ?Int64
    const cAs = 1 as Int64
    Assert.equals(cIs, true)
    Assert.equals(cAs, Some(1))
    0
}
