/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        12_01_01_03_a01_01

  @Level:         1

  @Assertion:   12.1.1.3(1) 1. If no exception is thrown during the evaluation of the expression e1,
                the expression e2 is not evaluated and the expression e3 is evaluated.

  @Description: Checks that given a try expression try {e1} catch (catchPattern) {e2} finally {e3},
                e2 is not evaluated whereas e3 is evaluated when no exception is thrown during the
                e1 evaluation.

  @Mode:	 run         

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
func f1() : Int32 {
    return 100
}

func f2() : Int32 {
    return 200
}

func f3() : Int32 {
    return 300
}

main() {
    var res : Int32 = 0
    let e = try {
        res = f1()
    } catch (_) {
        res = res + f2()
    } finally {
        res = res + f3()
    }

    e

    Assert.equals(400, res)
}
