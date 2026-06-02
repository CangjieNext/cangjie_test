// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

import std.ast.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
class TestA {
    @TestCase
    public func enumCase(): Unit {
        let enumTokens = quote(enum E { CTOR })
        let parsedEnum = (parseDecl(enumTokens) as EnumDecl).getOrThrow()
        parsedEnum.superTypes.add(RefType(quote(ToString)))
        let expected = quote(enum E <: ToString { CTOR })
        @Expect(compareTokens(expected, parsedEnum.toTokens()))
    }

    @TestCase
    public func classCase(): Unit {
        let classTokens = quote(class C {})
        let parsedClass = (parseDecl(classTokens) as ClassDecl).getOrThrow()
        parsedClass.superTypes.add(RefType(quote(ToString)))
        let expected = quote(class C <: ToString {})
        @Expect(compareTokens(expected, parsedClass.toTokens()))
    }

    @TestCase
    public func structCase(): Unit {
        let structTokens = quote(struct C {})
        let parsedStruct = (parseDecl(structTokens) as StructDecl).getOrThrow()
        parsedStruct.superTypes.add(RefType(quote(ToString)))
        let expected = quote(struct C <: ToString {})
        @Expect(compareTokens(expected, parsedStruct.toTokens()))
    }

    @TestCase
    public func extendCase(): Unit {
        let extendTokens = quote(extend Foo {})
        let parsedExtend = (parseDecl(extendTokens) as ExtendDecl).getOrThrow()
        parsedExtend.superTypes.add(RefType(quote(I1)))
        let expected = quote(extend Foo <: I1 {})
        @Expect(compareTokens(expected, parsedExtend.toTokens()))
    }

    @TestCase
    public func interfaceCase(): Unit {
        let interfaceTokens = quote(public interface I {})
        let parsedInterface = (parseDecl(interfaceTokens) as InterfaceDecl).getOrThrow()
        parsedInterface.superTypes.add(RefType(quote(I1)))
        let expected = quote(public interface I <: I1 {})
        @Expect(compareTokens(expected, parsedInterface.toTokens()))
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
