/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_03_a01_01

  @Level:         1

  @Assertion: 4.3(1) Conditional expressions (i.e., if expressions) facilitate 
              the execution of different branches based on whether certain
              condition is satisfied or not.
  @Description: Checks that conditional expressions facilitate the execution of
                the different branches based on whether certain condition is 
                satisfied or not.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var i = 15

func checkIf(inp: Array<String>) {
    var cnt = 0

    if (Assert.getRuntimeZero(inp) == 0) { 
        cnt++
    }

    if (Assert.getRuntimeZero(inp) > 0) { 
        Assert.fail(reason: "Should not reach here")
    }

    if (0 == 0) { 
        cnt++ 
    }

    if (i == 0) {
        Assert.fail(reason: "Should not reach here")
    }

    Assert.equals(2, cnt)
}

func checkIfElse(inp: Array<String>){
    var cnt = 0

    if (Assert.getRuntimeZero(inp) == 0) { 
        cnt++
    } else { 
        Assert.fail(reason: "Should not reach here")
    }

    if (Assert.getRuntimeZero(inp) != 0) { 
        Assert.fail(reason: "Should not reach here")
    } else { 
        cnt++
    }

    if (i == 15) { 
        cnt++
    } else { 
        Assert.fail(reason: "Should not reach here")
    }

    if (Assert.getRuntimeZero(inp) + 15 != 15) { 
        Assert.fail(reason: "Should not reach here")
    } else { 
        cnt++
    }

    Assert.equals(4, cnt)
}

func checkIfElseIf(inp: Array<String>) {
    var cnt = 0

    if (Assert.getRuntimeZero(inp) == 0) { 
        cnt++
    } else if (Assert.getRuntimeZero(inp) == -1) { 
        Assert.fail(reason: "Should not reach here")
    }

    if (Assert.getRuntimeZero(inp) != 0) { 
        Assert.fail(reason: "Should not reach here")
    } else if (Assert.getRuntimeZero(inp) == 14) { 
        Assert.fail(reason: "Should not reach here")
    }

    if (i == 15) { 
        cnt++
    } else if (i == 5) { 
        Assert.fail(reason: "Should not reach here")
    }

    if (Assert.getRuntimeZero(inp) + 15 != 15) { 
        Assert.fail(reason: "Should not reach here")
    } else if (i == 15) { 
        cnt++
    }

    Assert.equals(3, cnt)
}

func checkIfElseIfElse(inp: Array<String>) {
    var cnt = 0

    if (Assert.getRuntimeZero(inp) == 0) { 
        cnt++
    } else if (Assert.getRuntimeZero(inp) == -1) { 
        Assert.fail(reason: "Should not reach here")
    } else {
        Assert.fail(reason: "Should not reach here")
    }

    if (Assert.getRuntimeZero(inp) != 0) { 
        Assert.fail(reason: "Should not reach here")
    } else if (Assert.getRuntimeZero(inp) == 0) { 
        cnt ++
    } else {
        Assert.fail(reason: "Should not reach here")
    }

    if (i > 15) { 
        Assert.fail(reason: "Should not reach here")
    } else if (i == 3) { 
        Assert.fail(reason: "Should not reach here")
    } else {
        cnt++
    }

    if (Assert.getRuntimeZero(inp) + 15 != 15) { 
        Assert.fail(reason: "Should not reach here")
    } else if (Assert.getRuntimeZero(inp) + 15 == 15) { 
        cnt++
    } else {
        Assert.fail(reason: "Should not reach here")
    }

    Assert.equals(4, cnt)
 }

main(inp: Array<String>) { 
    checkIf(inp)
    checkIfElse(inp)
    checkIfElseIf(inp)
    checkIfElseIfElse(inp)
}
