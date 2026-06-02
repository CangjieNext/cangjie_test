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
import std.deriving.impl.*
import std.ast.*

@Test
class QualifiedNameTest {
    @TestCase
    func appendGenericsSimpleName() {
        let qName = QualifiedName("dddd")
        let arg = RefType(quote(String))
        let qType = qName.toType(arg)
        let result = qType.toTokens().toString()
        @Expect(result, "dddd < String >")
    }

    @TestCase
    func appendGenericsTest() {
        let qName = QualifiedName("a.bb.ccc")
        let arg = RefType(quote(String))
        let qType = qName.toType(arg)
        let result = qType.toTokens().toString()
        @Expect(result, "a.bb.ccc < String >")
    }

    @TestCase
    func toTypeTestSimple() {
        let qName = QualifiedName("ddd")
        let arg = RefType(quote(String))
        let ty = qName.toType([arg])

        @Expect(ty.toTokens().toString(), "ddd < String >")
    }

    @TestCase
    func toTypeTest() {
        let qName = QualifiedName("a.bb.ccc")
        let arg = RefType(quote(String))
        let ty = qName.toType([arg])

        @Expect(ty.toTokens().toString(), "a.bb.ccc < String >")
    }

    @TestCase
    func toTypeTest2() {
        let qName = QualifiedName("a.bb.ccc")
        let arg = RefType(quote(String))
        let ty = qName.toType([arg, arg])

        @Expect(ty.toTokens().toString(), "a.bb.ccc < String, String >")
    }

    @TestCase
    func badIdentifiers() {
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName("")
        })
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName(Array<Token>())
        })
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName([Token(TokenKind.LT, "<")])
        })
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName([Token(TokenKind.LT, "a.")])
        })
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName([Token(TokenKind.LT, ".b")])
        })
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName([Token(TokenKind.LT, ".c.")])
        })
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName([Token(TokenKind.LT, ".")])
        })
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName([Token(TokenKind.LT, " ")])
        })
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName([Token(TokenKind.LT, "aa bb")])
        })
        @ExpectThrows[IllegalArgumentException]({
            let _ = QualifiedName([Token(TokenKind.LT, "a..b")])
        })
    }

    @TestCase
    func fromAstQualifiedType() {
        let qt = QualifiedType(quote(a.bb.ccc))
        let qn = QualifiedName(qt)
        @Expect(qn.toString(), "a.bb.ccc")
    }

    @TestCase
    func fromIdentifier() {
        let qn = QualifiedName(Identifier("abc"))
        @Expect(qn.toString(), "abc")
    }

    @TestCase
    func testComponents() {
        let qn = QualifiedName("aa.bb.cc")
        @Expect(qn.components.toString(), "[aa, bb, cc]")
        let app = qn + "dd"
        @Expect(app.toString(), "aa.bb.cc.dd")
        let app2 = app + qn
        @Expect(app2.toString(), "aa.bb.cc.dd.aa.bb.cc")
    }
}

@Test
class GenericDeclTest {
    @TestCase
    func toString() {
        let str = RefType(quote(ToString))
        let t = declFor("T")
        @Expect(t.toString(), "T")
        @Expect(DerivingGenericSettings(t, [str]).toString(), "T <: ToString")
    }

    @TestCase
    func eq() {
        let a = declFor("T")
        let b = declFor("E")
        @Expect(a != b, true)
        @Expect(a == b, false)
    }

    @TestCase
    func hash() {
        @Expect(declFor("T").hashCode(), "T".hashCode())
    }

    private func declFor(name: String): GenericDecl {
        GenericDecl(Identifier(name))
    }
}

@Test
class DeriveOptionsTest {
    @TestCase
    func smokeTest() {
        let toStringType = RefType(quote(ToString))
        let constraint = ParsedGenericConstraint(Identifier("T"), [toStringType])
        let options = DeriveInterfaceOption(
            Identifier("ToString"),
            QualifiedName("std.core.ToString"),
            ParsedExplicitConstraints(
                Token(TokenKind.WHERE, "where"),
                [constraint]
            )
        )

        @Expect(constraint.toString(), "T <: ToString")
        @Expect(options.toString(), "ToString where T <: ToString")
    }
}
