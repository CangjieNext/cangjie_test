
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a11_01

  @Level:         1

  @Assertion:   6.1.2.2(11) - That means it’s possible to refer to further declared static member variables in a static
                initializer; 
  @Description: Checks that it’s possible to refer to static member variables in a static initializer.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

abstract class A {
    static var wA : Int64

    static let xA = 2

    static init() {
        wA = 1
        Assert.equals(2, xA)
        Assert.equals(33, yA)
        yA = 3
        zA = 4
    }

    static var yA = 33

    static let zA : Int64 
}

class C <: A {
    static var wC : Int64

    static let xC = 2

    static init() {
        wC = 1
        Assert.equals(2, xC)
        Assert.equals(33, yC)
        yC = 3
        zC = 4
    }

    static var yC = 33

    static let zC : Int64
}

struct S {
    static var w : Int64

    static let x = 2

    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }

    static var y = 33

    static let z : Int64
}

class G<T> {
    static var w : Int64

    static let x = 2

    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }

    static var y = 33

    static let z : Int64
}

main() {
    Assert.equals(1, A.wA)
    Assert.equals(2, A.xA)
    Assert.equals(3, A.yA)
    Assert.equals(4, A.zA)
    Assert.equals(1, C.wC)
    Assert.equals(2, C.xC)
    Assert.equals(3, C.yC)
    Assert.equals(4, C.zC)
    Assert.equals(1, S.w)
    Assert.equals(2, S.x)
    Assert.equals(3, S.y)
    Assert.equals(4, S.z)
    Assert.equals(1, G<String>.w)
    Assert.equals(2, G<String>.x)
    Assert.equals(3, G<String>.y)
    Assert.equals(4, G<String>.z)
}
