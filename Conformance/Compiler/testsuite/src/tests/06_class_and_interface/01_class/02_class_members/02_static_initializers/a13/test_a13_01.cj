
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a13_01

  @Level:         1

  @Assertion:   6.1.2.2(13) - Within a file, across classes, static initializers are called in a top-down way despite
                inheritance; 
  @Description: Checks that static initializers are called in a top-down way despite inheritance for classes.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

var s = ""
var ty = "_"

class A <: B {
    static init() {
        s += "A"
    }
}

class G1<T> <: B {
    static init() {
        s += "g1" + ty
    }
}

open class B {
    static init() {
        s += "B"
    }
}

class C <: B {
    static init() {
        s += "C"
    }
}

class G2<T> <: B {
    static init() {
        s += "g2" + ty
    }
}

class G3<T> <: G<T> {
    static init() {
        s += "g3" + ty
    }
}

class G4<T> <: G<Int8> {
    static init() {
        s += "g4" + ty
    }
}

let setTyInt16 = (ty = "<Int16>")

class D <: G<Int16> {
    static init() {
        s += "D"
    }
}

open class G<T> {
    static init() {
        s += "g" + ty
    }
}

class G5<T> <: G<T> {
    static init() {
        s += "g5" + ty
    }
}

class G6<T> <: G<Int32> {
    static init() {
        s += "g6" + ty
    }
}

let setTyInt64 = (ty = "<Int64>")

class E <: G<Int64> {
    static init() {
        s += "E"
    }
}

let setTyChar = (ty = "<Rune>")

let getG1 = G1<Rune>()

let setTyBool = (ty = "<Bool>")

let getG2 = G2<Bool>()

let setTyUnit = (ty = "<Unit>")

let getG3 = G3<Unit>()

let setTyFloat16 = (ty = "<Float16>")

let getG4 = G4<Float16>()

let setTyFloat32 = (ty = "<Float32>")

let getG5 = G5<Float32>()

let setTyFloat64 = (ty = "<Float64>")

let getG6 = G6<Float64>()

main() {
    Assert.equals("Ag1_BCg2_g3_g4_Dg<Int16>g5<Int16>g6<Int16>E", s)
}
