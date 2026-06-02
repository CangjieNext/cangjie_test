
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a12_01

  @Level:         1

  @Assertion:   6.1.2.2(12) - That also means that a static initializer may be located in a class or struct in any
                place, the order doesn’t matter; 
  @Description: Checks that static initializer may be declared anywhere in a class or struct and all static members
                can be referenced by it and the default-initialized static variables are already initialized at the
                time of static initializer invocation regardless of its placement there.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

abstract class A1 {
    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }

    static var w : Int64

    static let x = 2

    static var y = 33

    static let z : Int64 
}

abstract class A2 {
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

abstract class A3 {
    static var w : Int64

    static let x = 2

    static var y = 33

    static let z : Int64 

    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }
}

class C1 {
    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }

    static var w : Int64

    static let x = 2

    static var y = 33

    static let z : Int64 
}

class C2 {
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

class C3 {
    static var w : Int64

    static let x = 2

    static var y = 33

    static let z : Int64 

    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }
}

struct S1 {
    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }

    static var w : Int64

    static let x = 2

    static var y = 33

    static let z : Int64 
}

struct S2 {
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

struct S3 {
    static var w : Int64

    static let x = 2

    static var y = 33

    static let z : Int64 

    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }
}

class G1<T> {
    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }

    static var w : Int64

    static let x = 2

    static var y = 33

    static let z : Int64 
}

class G2<T> {
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

class G3<T> {
    static var w : Int64

    static let x = 2

    static var y = 33

    static let z : Int64 

    static init() {
        w = 1
        Assert.equals(2, x)
        Assert.equals(33, y)
        y = 3
        z = 4
    }
}

main() {
    Assert.equals(1, A1.w)
    Assert.equals(2, A1.x)
    Assert.equals(3, A1.y)
    Assert.equals(4, A1.z)
    Assert.equals(1, A2.w)
    Assert.equals(2, A2.x)
    Assert.equals(3, A2.y)
    Assert.equals(4, A2.z)
    Assert.equals(1, A3.w)
    Assert.equals(2, A3.x)
    Assert.equals(3, A3.y)
    Assert.equals(4, A3.z)
    Assert.equals(1, C1.w)
    Assert.equals(2, C1.x)
    Assert.equals(3, C1.y)
    Assert.equals(4, C1.z)
    Assert.equals(1, C2.w)
    Assert.equals(2, C2.x)
    Assert.equals(3, C2.y)
    Assert.equals(4, C2.z)
    Assert.equals(1, C3.w)
    Assert.equals(2, C3.x)
    Assert.equals(3, C3.y)
    Assert.equals(4, C3.z)
    Assert.equals(1, S1.w)
    Assert.equals(2, S1.x)
    Assert.equals(3, S1.y)
    Assert.equals(4, S1.z)
    Assert.equals(1, S2.w)
    Assert.equals(2, S2.x)
    Assert.equals(3, S2.y)
    Assert.equals(4, S2.z)
    Assert.equals(1, S3.w)
    Assert.equals(2, S3.x)
    Assert.equals(3, S3.y)
    Assert.equals(4, S3.z)
    Assert.equals(1, G1<Int16>.w)
    Assert.equals(2, G1<Int16>.x)
    Assert.equals(3, G1<Int16>.y)
    Assert.equals(4, G1<Int16>.z)
    Assert.equals(1, G2<Int32>.w)
    Assert.equals(2, G2<Int32>.x)
    Assert.equals(3, G2<Int32>.y)
    Assert.equals(4, G2<Int32>.z)
    Assert.equals(1, G3<Int64>.w)
    Assert.equals(2, G3<Int64>.x)
    Assert.equals(3, G3<Int64>.y)
    Assert.equals(4, G3<Int64>.z)
}
