
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a10_01

  @Level:         1

  @Assertion:   6.1.2.2(10) - A static initializer is called after all direct initializations of static member
                variables in this class or struct, like instance constructor is called after all direct
                initializations of fields;
  @Description: Checks that static initializer is called after all direct initializations.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

var classCounter = 0
var structCounter = 0
var genericClassCounter = 0
var abstractClassCounter = 0

abstract class A {
    private static let x = abstractClassCounter++

    static init() {
        Assert.equals(2, abstractClassCounter)
    }

    private static var y = abstractClassCounter++
}

class C <: A {
    static let x = classCounter++

    static init() {
        Assert.equals(2, classCounter)
    }

    static var y = classCounter++
}

struct S {
    static let x = structCounter++

    static init() {
        Assert.equals(2, structCounter)
    }

    static var y = structCounter++
}

class G<T> {
    static let x = genericClassCounter++

    static init() {
        Assert.equals(2, genericClassCounter)
        genericClassCounter = 0
    }

    static var y = genericClassCounter++
}

let g1 = G<Int64>()

let g2 = G<Rune>()

main() {}
