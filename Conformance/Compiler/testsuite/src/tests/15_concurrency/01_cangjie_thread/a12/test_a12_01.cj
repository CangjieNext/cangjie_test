/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         15_01_a12_01

  @Level:         1
  @Assertion:    15.1(12) Note that the closure in the spawn expression cannot
                 capture local variables declared by var. For details about
                 closures, see Closures.

  @Description:  Checks that closure in spawn expression can capture
                 - class variables
                 - global variables
                 - local immutable variables

  @Mode:         run
  @Negative:     no
  @Structure:    single

*/

import utils.assert.Assert

class A {
    let aLet = 5
    var aVar = "str"

    func start():Future<Bool> {
        spawn {
            return aVar != "AAA" && aLet > 2
        }
    }
}

let gLet = 5
var gVar = "str"

func gStart():Future<Bool> {
    spawn {
        return gVar != "AAA" && gLet > 10
    }
}

main(): Int64 {
    let lLet = 5
    let fut = spawn {
        return lLet == -1
    }

    Assert.isTrue(A().start().get())
    Assert.isFalse(gStart().get())
    Assert.isFalse(fut.get())
    0
}
