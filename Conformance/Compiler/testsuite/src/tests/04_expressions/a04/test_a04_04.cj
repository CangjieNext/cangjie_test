/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_04

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that conditional expression can be a part of the 
                composite expression. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

import utils.assert.Assert

open class C1 {
    open public func getId(): Int32 { 
        1 
    }
} 

open class C2 <: C1 {
    override open public func getId(): Int32 { 
        2 
    }
}

class C3 <: C2 {
    override public func getId(): Int32 { 
        3 
    }
}

let c1: C1 = C1();
let c2: C2 = C2();
let c3: C3 = C3();

func getX(x: Int64): Int64 {
    Assert.getRuntimeZero() + x
}

main() { 
    let unit1 = 
        if(getX(0) == 0) { 
            let unit2 = if(getX(2) == 0) { 
                2 
            }
            Assert.isTrue(unit2 is Unit)
            if(() != unit2) { 
                Assert.fail(reason: "Unit2 should have value ()") 
            }
        
            // if-else
            let unit3 = 
                if(getX(0) != 0) { 
                    println("Hello there")
                } else { 
                    println("Goodbye there")
                }
            Assert.isTrue(unit3 is Unit)
            if(() != unit3) { 
                Assert.fail(reason: "Unit should have value ()") 
            }

            let cc1 = 
                if(getX(-1) < 0) { 
                    c1
                } else { 
                    c2
                }
            Assert.isTrue(cc1 is C1)
            Assert.equals(1, cc1.getId())

            let x1 = 15 **
                (if(getX(-1) < 0) { 
                    5
                } else { 
                    10
                } + 2) * 
                    if(getX(0) == 0) {
                        2
                    } else {
                        3
                    }
            Assert.isTrue(x1 is Int64)
            Assert.equals(341718750, x1)

            let unit4 = 
                if(getX(11) < 0) { 
                    println("Hello") 
                } else if(getX(0) == 0) { 
                    println("Goodbye") 
                }
            Assert.isTrue(unit4 is Unit)
            if(() != unit4) {
                Assert.fail(reason: "Unit1 should have value ()")
            }

            let unit5 = 
                if(getX(0) < 0) { 
                    true 
                } else if(getX(1) == 0) { 
                    false
                }
            Assert.isTrue(unit5 is Unit)
            if(() != unit5) {
                Assert.fail(reason: "Unit5 should have value ()")
            }

            let unit6 = 
                if(getX(0) < 0) { 
                    C1() 
                } else if (getX(0) > 0) { 
                    C2() 
                }
            Assert.isTrue(unit6 is Unit)
            if(() != unit3) {
                Assert.fail(reason: "Unit6 should have value ()")
            }

            let unit7 = 
                if(getX(0) != 0) { 
                    println("Hello 1") 
                } else if (getX(0) == 0) { 
                    println("Hello 2") 
                } else { 
                    println("Hello 3") 
                }
            Assert.isTrue(unit7 is Unit)
            if(() != unit7) {
                Assert.fail(reason: "Unit7 should have value ()")
            }

            let i = 
                if(getX(0) != 0) { 
                    1
                } else if (getX(0) == 0) { 
                    2
                } else { 
                    3
                } % 
                    if(getX(1) != 0) { 
                        4
                    } else { 
                        5
                    }  + 150
            Assert.isTrue( i is Int64)
            Assert.equals(152, i)

            let cc2 = 
                if(getX(5) < 0) { 
                    c1
                } else if (getX(5) == 0) { 
                    c2 
                } else { 
                    c3 
                }
            Assert.isTrue(cc2 is C1)
            Assert.equals(3, cc2.getId())
        }

    Assert.isTrue(unit1 is Unit)
    if(() != unit1) {
        Assert.fail(reason: "Unit1 should have value ()")
    }
}
