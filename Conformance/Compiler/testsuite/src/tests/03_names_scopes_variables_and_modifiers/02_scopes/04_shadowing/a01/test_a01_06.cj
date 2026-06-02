/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a01_06

  @Level:         1

  @Assertion:    3.2.4(1) When two scopes overlap and the same name appears in both scopes, the name in the
                 lower-scope shadows the name in the upper-scope. As a result, the entity referred to by the
                 name in the lower-scope cannot be accessed directly through the name.

  @Description:  Check different kinds of scopes.
                 Check that name in type-internal scope shadows name in top-level scope. Enum case.

  @Mode:         run

  @Negative:     no

*/

package idpackage

import utils.assert.Assert
import utils.macros.*

var idVar = "unused"

func idFunc(): String { "unused" }

enum idEnum { idCons1 | idCons2 }

struct idStruct { }

class idClass { }

interface idInterface { }

type idAlias = String

enum Type<idCons1, idCons2> {
    | idPackage
    | idVar
    | idFunc(idCons1)
    | idEnum(idCons1, idCons2)
    | idStruct(idCons2)
    | idClass(idCons2)
    | idInterface(idCons2)
    | idAlias(idCons2)
}


main() {
    let e0 = Type<Bool, Bool>.idPackage
    @matchOrThrow [idPackage] (e0)

    let e1 = Type<Bool, Bool>.idVar
    @matchOrThrow [idVar] (e1)

    let e2 = Type<Bool, String>.idFunc(true)
    match (e2) {
        case idFunc(x) => Assert.equals(true, x)
        case _ => throw Exception("fail2")
    }

    let e3 = Type<Bool, String>.idEnum(true, "ok")
    match (e3) {
        case idEnum(x, y) => if (true) { Assert.equals(true, x); Assert.equals("ok", y) }
        case _ => throw Exception("fail3")
    }

    let e4 = Type<Int32, Int32>.idStruct(100)
    match (e4) {
        case idStruct(y) => Assert.equals(100, y)
        case _ => throw Exception("fail4")
    }

    let e5 = Type<Int32, Int32>.idClass(100)
    match (e5) {
        case idClass(y) => Assert.equals(100, y)
        case _ => throw Exception("fail5")
    }

    let e6 = Type<Int32, Int32>.idInterface(100)
    match (e6) {
        case idInterface(y) => Assert.equals(100, y)
        case _ => throw Exception("fail6")
    }

    let e7 = Type<Int32, Int32>.idInterface(100)
    match (e7) {
        case idInterface(y) => Assert.equals(100, y)
        case _ => throw Exception("fail7")
    }
}
