/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        12_01_a01_01

  @Level:         1
  @Assertion:   12.1(1) Try expressions are divided into two types based on 
                whether automatic resource management is involved: the ordinary 
                try expressions that do not involve automatic resource management,
                and the try-with-resources expressions that automatically manage
                resources. 
  @Description: Checks ordinary try-expression.
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @CompileWarnings: Ignore

*/

import utils.assert.Assert

main(ina :Array<String>) {
    let t : Bool = Assert.getRuntimeZero(ina) == 0
    var str: String = ""

    try {
        str += "0"
    } catch (_) {
        str += "1"
    } finally {
        str += "2"
    }
    Assert.equals("02", str)

    str = ""
    try {
        str += "0"
    } catch (_) {
        str += "1"
    } 
    Assert.equals("0", str)

    str = ""
    try {
        str += "0"
        if(t) {
            throw Exception("My Exception")
        }
        str += "1"
    } catch (_) {
        str += "2"
    } finally {
        str += "3"
    }
    Assert.equals("023", str)

    str = ""
    try {
        str += "0"
        if(t) {
            throw Exception("My Exception")
        }
        str += "1"
    } catch (_) {
        str += "2"
    }
    Assert.equals("02", str)
}
