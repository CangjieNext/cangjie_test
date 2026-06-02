/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a01_07

  @Level:         1

  @Assertion:    3.2.4(1) When two scopes overlap and the same name appears in both scopes, the name in the
                 lower-scope shadows the name in the upper-scope. As a result, the entity referred to by the
                 name in the lower-scope cannot be accessed directly through the name.

  @Description:  Check different kinds of scopes.
                 Check that name in top-level scope shadows name in package-level scope.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: package_other.cj

*/

package p

import utils.assert.Assert
import other.*

var idVar = "p_idVar"

func idFunc(): String { "p_idFunc_result" }

enum idEnum { idCons1 | idCons2 | idConsNew }

struct idStruct {
    let pField = "p_field"
}

class idClass {
    let pField = "p_field"
}

type idAlias = String

interface idInterface {
    func interfaceFunc(): idAlias
}

class UseIdInterface <: idInterface {
    public func interfaceFunc(): idAlias { "success" }
}

main() {
    Assert.equals("p_idVar", idVar)

    Assert.equals("p_idFunc_result", idFunc())

    Assert.isTrue(idCons1 is idEnum)
    Assert.isTrue(idCons2 is idEnum)
    let e: idEnum = idConsNew
    Assert.isTrue(e is idEnum)

    let s = idStruct()
    Assert.isTrue(s is idStruct)
    Assert.equals("p_field", s.pField)

    let c = idClass()
    Assert.isTrue(c is idClass)
    Assert.equals("p_field", c.pField)

    let i = UseIdInterface()
    Assert.equals("success", i.interfaceFunc())
}
