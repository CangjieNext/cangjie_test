/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_03_a01_02

  @Level:         1

  @Assertion:    3.2.3.3(1) The scope of classes/interface/struct’s members is the entire class/interface/struct
                  definition.

  @Description:  Check that class var variables can be accessible inside class definition. 

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

class C {
    var a: Int64
    static var foo1: String = "foo1"
    static public var foo2: String = "foo2"
    static private var foo3: String = "foo3"
    public var foo4: String = "foo4"
    private var foo5: String = "foo5"
    var foo6: String = "foo6"

    init (p: Int64) {
        this.a = p
    }

    func getSum(): Int64 { a }

    static func getFoo1(): String { foo1 }

    static func getFoo2(): String { foo2 }

    static func getFoo3(): String { foo3 }

    func getFoo4(): String { foo4 }

    func getFoo5(): String { foo5 }

    func getFoo6(): String { foo6 }
}

main() {
    var obj = C(2023)
    Assert.equals(2023  , obj.getSum())
    Assert.equals("foo1", C.getFoo1())
    Assert.equals("foo2", C.getFoo2())
    Assert.equals("foo3", C.getFoo3())
    Assert.equals("foo4", obj.getFoo4())
    Assert.equals("foo5", obj.getFoo5())
    Assert.equals("foo6", obj.getFoo6())
}
