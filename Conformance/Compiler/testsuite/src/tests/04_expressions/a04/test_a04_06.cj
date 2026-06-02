/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_06

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that loop expression can be a part of the composite
                expression. Tests for-in, while, do-while loops, break, 
                continue, range expressions.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var intArray = [0, 1, 2, 3, 4]

main() {
    var cnt = 0

    var unit = for (item in intArray) {
        Assert.equals(cnt, item)
        cnt++

        var cnt1 = 0
        var unit1 = while (cnt1 < 5) {
            Assert.equals(intArray[cnt1], cnt1)
            cnt1++

            var cnt2 = 0
            var unit2 = do {
                Assert.equals(intArray[cnt2], cnt2)
                cnt2++

                var cnt_break = 0    
                for (i in 0..5) {
                    cnt_break = i
                    if(cnt_break > 3) {
                        var i = 0
                        var cnt = 0
                        do {
                            i++
                            if(i == 3) {
                                cnt++
                                continue  
                            }
                        } while(i < 5)
                        Assert.equals(1, cnt) 
                        break  
                    }
                }
                Assert.equals(4, cnt_break) 
            
            } while (cnt2 < 5)
            Assert.isTrue(unit2 is Unit)
            Assert.equals(5, cnt2)
            if(() != unit2) { 
                Assert.fail(reason: "Unit should have value ()") 
            }
        }

        Assert.isTrue(unit1 is Unit)
        Assert.equals(5, cnt1)
        if(() != unit1) { 
            Assert.fail(reason: "Unit should have value ()") 
        }
    }

    Assert.isTrue(unit is Unit)
    Assert.equals(5, cnt)
     if(() != unit) { 
        Assert.fail(reason: "Unit should have value ()") 
    }
}
