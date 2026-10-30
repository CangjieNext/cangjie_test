/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %cmp_utest_opt --mock=on %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

interface IWithDefault {
    func defaultValue(): Int64 {
        return 42
    }
}

// Default implementation is attached to the class through an extend: mocking the
// class must not generate duplicated accessors for the same default method.
class ClassWithExtendedInterface {}

extend ClassWithExtendedInterface <: IWithDefault {}

interface IBase {
    func baseValue(): Int64 {
        return 7
    }
}

// Default implementation is inherited transitively through another interface:
// it must remain mockable.
interface IDerived <: IBase {}

class ClassWithTransitiveDefault <: IDerived {}

class ClassWithDirectDefault <: IWithDefault {}

@Test
public class Test_Mock_InterfaceDefaults {
    @TestCase
    func test_extend_default_is_mockable(): Unit {
        let mocker = mock<ClassWithExtendedInterface>()
        @On(mocker.defaultValue()).returns(11)
        @Expect(mocker.defaultValue(), 11)
    }

    @TestCase
    func test_transitive_default_is_mockable(): Unit {
        let mocker = mock<ClassWithTransitiveDefault>()
        @On(mocker.baseValue()).returns(13)
        @Expect(mocker.baseValue(), 13)
    }

    @TestCase
    func test_direct_default_is_mockable(): Unit {
        let mocker = mock<ClassWithDirectDefault>()
        @On(mocker.defaultValue()).returns(17)
        @Expect(mocker.defaultValue(), 17)
    }

    @TestCase
    func test_spy_calls_original_default(): Unit {
        let real = ClassWithDirectDefault()
        let spyObj = spy<ClassWithDirectDefault>(real)
        @On(spyObj.defaultValue()).callsOriginal()
        @Expect(spyObj.defaultValue(), 42)
    }
}
