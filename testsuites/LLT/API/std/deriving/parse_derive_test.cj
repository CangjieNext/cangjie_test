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
import std.collection.{collectArray, first}
import std.unittest.*
import std.unittest.testmacro.*

@Test
class ParseDeriveInputTest {
    private let logger = CollectingLogger()

    @BeforeEach
    func cleanup() {
        logger.clear()
    }

    @AfterEach
    func e() {
        let messages = logger.collect()
        for (msg in messages) {
            failExpect(msg)
        }
    }

    @TestCase
    func loggerTest() {
        let t = Token(TokenKind.IDENTIFIER, "a")
        logger.error(t, "Error1")
        logger.warning(t, "Warning2")
        let result = logger.collect().toString()
        logger.clear()

        @Expect(result, "[[ERROR] Error1: a, [WARNING] Warning2: a]")
    }

    @TestCase
    func smokeTest() {
        let params = DeriveInputParser.params(quote(ToString where T <: ToString & Hashable, U <: Hashable), logger)
        @Expect(params.size, 1)
        @Assert(params.size >= 1)

        let param = params[0]
        @Expect(param.interfaceName.value, "ToString")
        @Expect(param.constraints.size, 2)

        @Assert(param.constraints.size > 0)
        let first = param.constraints[0]

        @Expect(first.genericParameter.value, "T")
        @Expect(first.toString(), "T <: ToString & Hashable")

        @Assert(param.constraints.size > 1)
        let second = param.constraints[1]
        @Expect(second.genericParameter.value, "U")
        @Expect(second.toString(), "U <: Hashable")

        @Expect(param.toString(), "ToString where T <: ToString & Hashable, U <: Hashable")
    }

    @TestCase
    func ambiguity() {
        let params = DeriveInputParser.params(quote(ToString where T <: ToString & Hashable, Hashable), logger)
        @Expect(params.size, 2)

        @Assert(params.size >= 1)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].constraints.size, 1)
        @Expect(params[0].toString(), "ToString where T <: ToString & Hashable")

        @Assert(params.size >= 2)
        @Expect(params[1].interfaceName.value, "Hashable")
        @Expect(params[1].constraints.size, 0)
        @Expect(params[1].toString(), "Hashable")
    }

    @TestCase
    func simple() {
        let params = DeriveInputParser.params(quote(ToString), logger)
        @Assert(params.size, 1)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].constraints.size, 0)
        @Expect(params[0].toString(), "ToString")
    }

    @TestCase
    func simplePair() {
        let params = DeriveInputParser.params(quote(ToString, Hashable), logger)
        @Assert(params.size, 2)

        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].constraints.size, 0)
        @Expect(params[0].toString(), "ToString")

        @Expect(params[1].interfaceName.value, "Hashable")
        @Expect(params[1].constraints.size, 0)
        @Expect(params[1].toString(), "Hashable")
    }

    @TestCase
    func singleUpperBound() {
        let params = DeriveInputParser.params(quote(ToString where T <: ToString), logger)
        @Assert(params.size, 1)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].constraints.size, 1)
        @Expect(params[0].toString(), "ToString where T <: ToString")

        @Expect(params[0].constraints[0].toString(), "T <: ToString")
    }

    @TestCase
    func twoUpperBounds() {
        let params = DeriveInputParser.params(quote(ToString where T <: ToString & Hashable), logger)
        @Assert(params.size, 1)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].toString(), "ToString where T <: ToString & Hashable")
        @Assert(params[0].constraints.size, 1)

        @Expect(params[0].constraints[0].toString(), "T <: ToString & Hashable")
        @Expect(params[0].constraints[0].upperBounds[0].toTokens().toString(), "ToString")
        @Expect(params[0].constraints[0].upperBounds[1].toTokens().toString(), "Hashable")
    }

    @TestCase
    func threeUpperBounds() {
        let params = DeriveInputParser.params(quote(ToString where T <: ToString & Hashable & Equatable<T>), logger)
        @Assert(params.size, 1)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].toString(), "ToString where T <: ToString & Hashable & Equatable < T >")
        @Assert(params[0].constraints.size, 1)

        @Expect(params[0].constraints[0].toString(), "T <: ToString & Hashable & Equatable < T >")
        @Expect(params[0].constraints[0].upperBounds.size, 3)
        @Expect(params[0].constraints[0].upperBounds[0].toTokens().toString(), "ToString")
        @Expect(params[0].constraints[0].upperBounds[1].toTokens().toString(), "Hashable")
        @Expect(params[0].constraints[0].upperBounds[2].toTokens().toString(), "Equatable < T >")
    }

    @TestCase
    func qualifiedName() {
        let params = DeriveInputParser.params(quote(std.core.ToString, my.pkg.Custom where T <: std.core.String), logger)

        @Expect(params.size, 2)
        @Assert(params.size > 0)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].resolvedInterface.toString(), "std.core.ToString")
        @Expect(params[0].constraints.size, 0)

        @Assert(params.size > 1)
        @Expect(params[1].interfaceName.value, "Custom")
        @Expect(params[1].resolvedInterface.toString(), "my.pkg.Custom")
        @Expect(params[1].constraints[0].toString(), "T <: std.core.String")
    }

    @TestCase
    func funcType() {
        let params = DeriveInputParser.params(quote(ToString where T <: () -> Unit), logger)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].constraints[0].toString(), "T <:() -> Unit")
    }

    @TestCase
    func tunpleType() {
        let params = DeriveInputParser.params(quote(ToString where T <: (Int, Int)), logger)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].constraints[0].toString(), "T <:(Int, Int)")
    }

    @TestCase
    func optionType() {
        let params = DeriveInputParser.params(quote(ToString where T <: ?Int), logger)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].constraints[0].toString(), "T <:?Int")
    }

    @TestCase
    func optionType2() {
        let params = DeriveInputParser.params(quote(ToString where T <: Option<Int>), logger)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].constraints[0].toString(), "T <: Option < Int >")
    }

    @TestCase
    func leftRightShiftTokenHack() {
        let params = DeriveInputParser.params(quote(ToString where T <: X<Y<Z>>), logger)
        @Expect(params[0].interfaceName.value, "ToString")
        @Expect(params[0].constraints[0].toString(), "T <: X < Y < Z >>")
    }
}
