/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        12_01_a01_02

  @Level:         1
  @Assertion:   12.1(1) Try expressions are divided into two types based on 
                whether automatic resource management is involved: the ordinary 
                try expressions that do not involve automatic resource management,
                and the try-with-resources expressions that automatically manage
                resources. 
  @Description: Checks try-with-resource expressions.
  @Mode:        run
  @Negative:    no
  @Structure:   single
  @CompileWarnings: Ignore

*/

import utils.assert.Assert

var str: String = ""

class Res <: Resource {
    var resClosed = false

    public func isClosed() : Bool {
        resClosed
    }

    public func close() : Unit {
        str += "c"
        resClosed = true
    }
}

main(ina :Array<String>) {
    let t : Bool = Assert.getRuntimeZero(ina) == 0
    str = ""
    try(res = Res()) {
        str += "0"
    } catch (_) {
        str += "1"
    } finally {
        str += "2"
    }
    Assert.equals("0c2", str)

    str = ""
    try(res = Res()) {
        str += "0"
    } catch (_) {
        str += "1"
    } 
    Assert.equals("0c", str)

    str = ""
    try(res = Res()) {
        str += "0"
        if (t) {
            throw Exception("My Exception")
        }
        str += "1"
    } catch (_) {
        str += "2"
    } finally {
        str += "3"
    }
    Assert.equals("0c23", str)

    str = ""
    try(res = Res()) {
        str += "0"
        if (t) {
            throw Exception("My Exception")
        }
        str += "1"
    } catch (_) {
        str += "2"
    }
    Assert.equals("0c2", str)

    str = ""
    try(res = Res()) {
        str += "0"
    } 
    Assert.equals("0c", str)
}
