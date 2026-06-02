/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt --no-color 2>&1 | compare %f
// ASSERT: scan-1 Config verified

import std.unittest.*
import std.unittest.testmacro.*
import std.time.*

@UnittestOption[Int64](a)

@UnittestOption[String](b)

class ConfigPrint <: DataStrategy<Unit> & DataProvider<Unit> {
    public prop isInfinite: Bool {
        get() {
            false
        }
    }

    public func provide(): Iterable<Unit> {
        [()]
    }

    public func provider(configuration: Configuration): DataProvider<Unit> {
        @Assert(configuration.get<Duration>(KeyTimeout.timeout), Some(2 * Duration.second))
        @Assert(configuration.get<Bool>(KeyParallel.parallel), Some(true))
        @Assert(configuration.get(KeyA.a), Some(111))
        @Assert(configuration.get(KeyB.b), Some("foo"))
        println("Config verified")
        this
    }
}

func createTest() {
    UnitTestCase.createParameterized("test", ConfigPrint()) {_ =>}
}

@TestBuilder
@Configure[a: 100, b: "foo"]
@Timeout[2 * Duration.second]
@Parallel
@Configure[a: 111]
func f(): TestSuite {
    TestSuite.builder("suite").add(createTest()).build()
}
