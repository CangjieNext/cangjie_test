/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_07

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that try expression can be a part of the composite
                expression. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

import utils.assert.Assert

main() {
    var cnt = 0
    var unit1 = try { 
        try { 
            cnt++
            var i = try {
                var str = try {
                    try {
                        cnt++
                        throw Exception()
                        Assert.fail(reason: "Should not reach here.")
                        "try"
                    } catch (_) { 
                        Assert.equals(2, cnt)
                        cnt++
                        "catch"
                    } finally {
                        Assert.equals(3, cnt)
                        cnt++
                        "finally"
                    }
                    Assert.equals(4, cnt)
                    cnt++
                    throw Exception()
                    Assert.fail(reason: "Should not reach here.")
                    "try"
                } catch (_) { 
                    Assert.equals(5, cnt)
                    cnt++
                    "catch"
                } 
                Assert.equals("catch", str)
                Assert.equals(6, cnt)
                cnt++
                1
            } catch (_) { 
                Assert.fail(reason: "Should not reach here.")
                2
            } + try { 
                Assert.equals(7, cnt)
                cnt++
                throw Exception()
                Assert.fail(reason: "Should not reach here.")
                3
            } catch (_) { 
                Assert.equals(8, cnt)
                cnt++
                4
            } finally {
                Assert.equals(9, cnt)
                cnt++
                5
            } * try {
                Assert.equals(10, cnt)
                cnt++
                throw Exception() 
                Assert.fail(reason: "Should not reach here.")
                6
            } catch (_) { 
                Assert.equals(11, cnt)
                cnt++
                7
            } finally {
                Assert.equals(12, cnt)
                cnt++
                8
            } % try {
                Assert.equals(13, cnt)
                cnt++
                9
            } catch (_) { 
                Assert.fail(reason: "Should not reach here.")
            } finally {
                Assert.equals(14, cnt)
                cnt++
                9
            }
            Assert.equals(1, i)
            throw Exception() 
        } catch (_) { 
            try {
                Assert.equals(15, cnt)
                cnt++
                throw Exception() 
                Assert.fail(reason: "Should not reach here.")
            } catch (_) { 
                Assert.equals(16, cnt)
                cnt++
            } finally {
                Assert.equals(17, cnt)
                cnt++
            }
        } 
    } catch (_) {
        Assert.fail(reason: "Should not reach here.")
    }

    Assert.equals(18, cnt)
    Assert.isTrue(unit1 is Unit)
    if(() != unit1) { 
        Assert.fail(reason: "Unit should have value ()") 
    }
}

