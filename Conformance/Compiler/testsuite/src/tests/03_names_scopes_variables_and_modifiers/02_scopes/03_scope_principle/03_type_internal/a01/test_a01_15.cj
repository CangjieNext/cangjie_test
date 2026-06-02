/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_03_03_a01_15

  @Level:         1

  @Assertion:    3.2.3.3(1) The scope of classes/interface/struct’s members is the entire class/interface/struct
                  definition.

  @Description:  Check that struct's members can be accessible inside struct definition.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

struct S {
    var a: Int64
    var b: Int64
    static let foo: String = "foo"
 
    init (p1: Int64, p2: Int64) {
        this.a = p1
        this.b = p2
    }

    func getA(): Int64 { a }

    static func getFoo(): String { foo }

    mut func setATo2023() {
        this.a = 2023
    }
}

main() {
    var obj = S(2022, 2023)
    Assert.equals(2022 , obj.getA())
    Assert.equals(2023 , obj.b)
    Assert.equals("foo", S.getFoo())

    obj.setATo2023()
    Assert.equals(2023, obj.getA())
}