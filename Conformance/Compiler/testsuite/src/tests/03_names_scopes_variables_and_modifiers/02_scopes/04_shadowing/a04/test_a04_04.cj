/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a04_04

  @Level:         1

  @Assertion:    3.2.4(4) If the name x is a variable, the variable in the upper-scope is shadowed.
                 For specific rules on masking of member variables, see Chapter of “Class and Interface”.

  @Description:  Check shadowing member variables. Struct case.

  @Mode:         run

  @Negative:     no

*/

package test

import utils.assert.Assert

struct Type {
    var instance = "instance"
    let instance2 = "instance2"
    static var stat = "static"
    static let stat2 = "static2"
    var f1: (Int64, Int64) -> Int64 = { instance, instance2 => instance + instance2 }
    var f2: (Int64, Int64) -> Int64 = { stat, stat2 => stat + stat2 }
    static var f3: (Int64, Int64) -> Int64 = { stat, stat2 => stat + stat2 }

    Type(instance: String, stat: String) {
        Assert.equals("foo", instance);
        Assert.equals("bar", stat);
        if (true) {
            var instance = "a"
            var stat = "b"
            Assert.equals("a", instance);
            Assert.equals("b", stat);
        }
    }

    func test() {
        Assert.equals(10, f1(5,5));
        Assert.equals(10, f2(5,5));
    }

    static func statTest() {
        Assert.equals(10, f3(5,5));
    }
}

main() {
    Type("foo", "bar").test()
    Type.statTest()
    0
}
