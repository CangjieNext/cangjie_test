/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a01_01

  @Level:         1

  @Assertion:    3.2.4(1) When two scopes overlap and the same name appears in both scopes, the name in the
                 lower-scope shadows the name in the upper-scope. As a result, the entity referred to by the
                 name in the lower-scope cannot be accessed directly through the name.

  @Description:  Check different kinds of scopes.
                 Check that name in local-level scope shadows name in top-level scope.

  @Mode:         run

  @Negative:     no

*/

package idpackage

import utils.assert.Assert

var idVar = "unused"

func idFunc(): String { "unused" }

enum idEnum { idCons1 | idCons2 }

struct idStruct { }

class idClass { }

interface idInterface { }

type idAlias = String

main() {
    let idPackage = "ok"
    Assert.equals("ok", idPackage)

    func idVar(): String { "ok" }
    Assert.equals("ok", idVar())

    var idFunc = "ok"
    Assert.equals("ok", idFunc)

    let idCons1: Int32 = 100
    let idCons2: () -> Int32 = { => 200 }
    let idEnum: Int32 = idCons1 + idCons2()
    Assert.equals(300, idEnum)

    var idStruct = "ok"
    Assert.isTrue(idStruct is String)

    let idClass = "ok"
    Assert.isTrue(idClass is String)

    func idInterface(): String { "ok" }
    Assert.equals("ok", idInterface())

    let idAlias = false
    Assert.isTrue(idAlias is Bool)
}
