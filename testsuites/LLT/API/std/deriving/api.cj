/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt --disable-reflection %cmp_utest_opt %f -o %output
// EXEC: %run %run_opt %output %run_utest_opt %run_args

package std.deriving.tests

import std.deriving.api.*
import std.ast.*

@Test
class TargetDeriving {
    @TestCase
    func plain() {
        let t = targetFor(quote(class C {}))
        @Expect(t.isFinal, true)
        @Expect(t.isSealedClass, false)
        @Expect(t.isAbstractClass, false)
        @Expect(t.allGenerics.isEmpty(), true)
        @Expect(t.hasAnyGenerics, false)
        @Expect(t.superTypes.isEmpty(), true)
        @Expect(t.superTypeNames.isEmpty(), true)
    }

    @TestCase
    func structTest() {
        let t = targetFor(quote(struct S {}))
        @Expect(t.isFinal, true)
        @Expect(t.isSealedClass, false)
        @Expect(t.isAbstractClass, false)
        @Expect(t.allGenerics.isEmpty(), true)
        @Expect(t.hasAnyGenerics, false)
        @Expect(t.superTypes.isEmpty(), true)
        @Expect(t.superTypeNames.isEmpty(), true)
    }

    @TestCase
    func enumTest() {
        let t = targetFor(quote(enum E { A }))
        @Expect(t.isFinal, true)
        @Expect(t.isSealedClass, false)
        @Expect(t.isAbstractClass, false)
        @Expect(t.allGenerics.isEmpty(), true)
        @Expect(t.hasAnyGenerics, false)
        @Expect(t.superTypes.isEmpty(), true)
        @Expect(t.superTypeNames.isEmpty(), true)
    }

    @TestCase
    func openClass() {
        let t = targetFor(quote(open class O {}))
        @Expect(t.isFinal, false)
        @Expect(t.isNonFinal, true)
        @Expect(t.isSealedClass, false)
        @Expect(t.isAbstractClass, false)
        @Expect(t.allGenerics.isEmpty(), true)
        @Expect(t.hasAnyGenerics, false)
        @Expect(t.superTypes.isEmpty(), true)
        @Expect(t.superTypeNames.isEmpty(), true)
    }

    @TestCase
    func abstractClass() {
        let t = targetFor(quote(abstract class O {}))
        @Expect(t.isFinal, false)
        @Expect(t.isNonFinal, true)
        @Expect(t.isSealedClass, false)
        @Expect(t.isAbstractClass, true)
        @Expect(t.allGenerics.isEmpty(), true)
        @Expect(t.hasAnyGenerics, false)
        @Expect(t.superTypes.isEmpty(), true)
        @Expect(t.superTypeNames.isEmpty(), true)
    }

    @TestCase
    func abstractPublicClass() {
        let t = targetFor(quote(public abstract class O {}))
        @Expect(t.isFinal, false)
        @Expect(t.isNonFinal, true)
        @Expect(t.isSealedClass, false)
        @Expect(t.isAbstractClass, true)
        @Expect(t.allGenerics.isEmpty(), true)
        @Expect(t.hasAnyGenerics, false)
        @Expect(t.superTypes.isEmpty(), true)
        @Expect(t.superTypeNames.isEmpty(), true)
    }

    @TestCase
    func sealedClass() {
        let t = targetFor(quote(sealed class O {}))
        @Expect(t.isFinal, false)
        @Expect(t.isNonFinal, true)
        @Expect(t.isSealedClass, true)
        @Expect(t.isAbstractClass, false)
        @Expect(t.allGenerics.isEmpty(), true)
        @Expect(t.hasAnyGenerics, false)
        @Expect(t.superTypes.isEmpty(), true)
        @Expect(t.superTypeNames.isEmpty(), true)
    }

    @TestCase
    func superTypes() {
        let t = targetFor(quote(class Child <: ToString {}))
        @Expect(t.superTypeNames.toString(), "[ToString]")
    }

    @TestCase
    func superTypes2() {
        let t = targetFor(quote(class Child2 <: Equatable<Child> & ToString {}))
        @Expect(t.superTypeNames.toString(), "[Equatable, ToString]")
    }

    @TestCase
    func superTypesQualified() {
        let t = targetFor(quote(class Child2 <: core.ToString {}))
        @Expect(t.superTypeNames.toString(), "[core.ToString]")
    }

    @TestCase
    func generics() {
        let t = targetFor(quote(class C<T> {}))
        @Expect(t.hasAnyGenerics, true)
        @Expect(t.allGenerics.toString(), "[T]")
    }
}

@Test
class IdentifierTest {
    @TestCase
    func toString() {
        @Expect(Identifier("aaa1").toString(), "aaa1")
        @Expect(Identifier(id("aaa")).toString(), "aaa")
    }

    @TestCase
    func toType() {
        @Expect(Identifier("bbbb").toType().identifier.value, "bbbb")
    }

    @TestCase
    func badToken() {
        @ExpectThrows[IllegalArgumentException]({
            let _ = Identifier(Token(TokenKind.LT, "<"))
        })
    }
}

@Test
class TargetNamedAttributeTest {
    @TestCase
    func toString() {
        @Expect(attrFor(quote(var x = 1)).toString(), "x")
        @Expect(attrFor(quote(var y: Int)).toString(), "y")
        @Expect(attrFor(quote(prop z: Int {})).toString(), "z")
        @Expect(attrFor(quote(func f(a: Int) {})).toString(), "a")
    }
}

private func targetFor(decl: Decl): DerivingTarget {
    DerivingTarget(decl, [], [], DerivingSettings([], [], [], [], []))
}

private func targetFor(decl: Tokens): DerivingTarget {
    targetFor(parseDecl(decl))
}

private func id(name: String): Token {
    Token(TokenKind.IDENTIFIER, name)
}

private func attrFor(input: Tokens): TargetNamedAttribute {
    match (parseDecl(input)) {
        case v: VarDecl => TargetNamedAttribute.FieldAttribute(v)
        case p: PropDecl => TargetNamedAttribute.PropertyAttribute(p)
        case fn: FuncDecl => TargetNamedAttribute.ConstructorFieldAttribute(fn.funcParams[0])
        case _ => throw Exception()
    }
}
