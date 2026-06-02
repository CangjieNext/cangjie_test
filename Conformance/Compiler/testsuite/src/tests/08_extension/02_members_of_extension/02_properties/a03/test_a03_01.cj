/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_02_02_a03_01

  @Level:         1

  @Assertion:       8.2.2(3) For example:
                    extend Int64 {
                        mut prop i: Int64 {
                            get() {
                                0
                            }
                            set(value) {}
                        }
                    }

  @Description:     Positive example from Spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

  @Issue:           6124

*/

import utils.assert.Assert

extend Int64 {
    prop i: Int64 {
        get() {
            0
        }
    }
}

main() { 
    var myVar: Int64 = 12
    Assert.isTrue(myVar is Int64)
    Assert.equals(12, myVar)
    Assert.equals(0, myVar.i)
} 
