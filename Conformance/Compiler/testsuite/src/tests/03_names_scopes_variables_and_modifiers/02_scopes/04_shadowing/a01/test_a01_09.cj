/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a01_09

  @Level:         1

  @Assertion:    3.2.4(1) When two scopes overlap and the same name appears in both scopes, the name in the
                 lower-scope shadows the name in the upper-scope. As a result, the entity referred to by the
                 name in the lower-scope cannot be accessed directly through the name.

  @Description:  Check different kinds of scopes.
                 Check that name in local-level scope shadows name in type-internal scope.

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

struct S {
    let typeVar: Bool = true
    func typeFunc(): Bool { true }

    S(typeVar: String, typeFunc: String) {
        Assert.equals("somevalues", typeVar + typeFunc)
    }
}

interface I {
    func interfaceFunc(): Bool
}

open class B <: I {
    public func interfaceFunc(): Bool { true }
    public func baseFunc(): Bool { return true }
}

class C<T> <: B {
    static let typeVar = 123
    private func typeFunc(x: T) { x }

    C(interfaceFunc: String, T!: Int32 = 100, baseFunc!: String = "") {
        let typeVar = "foo"
        let typeFunc = "bar"
        Assert.equals(20, T)
        Assert.equals("somevalues", interfaceFunc + baseFunc)
    }
}

main() {
    let s = S("some", "values")
    let C = C<String>("some", T: 20, baseFunc:"values")
}
