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

import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

public class Example {
    public var ss: Int64 = 1
    public mut prop vv: String {
        get() {
            "vv"
        }
        set(s) {
        }
    }
    public func a(): String {
        "a"
    }
    public func b(): Int64 {
        11
    }
    public func c(): Unit {
        println("nothing")
    }
}

@Test
public class Test_Mock_DoesNothing {
    let mocker = mock<Example>()

    @TestCase
    func test01(): Unit {
        @On(mocker.c()).returns()
        mocker.c()
        Verify.unordered(@Called(mocker.c()))
    }

    @TestCase
    func test02(): Unit {
        @On(mocker.c()).returns()
        mocker.c()
        Verify.that(@Called(mocker.c()).atLeastTimes(1))
    }

    @TestCase
    func test03(): Unit {
        let sField = SyntheticField.create(initialValue: 1234)
        @On(mocker.ss = _).doesNothing()
        @On(mocker.ss).getsField(sField)
        mocker.ss = 100
        mocker.ss = 123
        Verify.unordered(@Called(mocker.ss = _).times(2))
        @Assert(mocker.ss, 1234)
    }

    @TestCase
    func test04(): Unit {
        let sField = SyntheticField.create(initialValue: "v")
        @On(mocker.vv = _).doesNothing()
        @On(mocker.vv).getsField(sField)
        mocker.vv = "vvv"
        Verify.unordered(@Called(mocker.vv = _).times(1))
        @Assert(mocker.vv, "v")
    }

    @TestCase
    func test05(): Unit {
        let sField = SyntheticField.create(initialValue: 1234)
        @On(mocker.ss = _).doesNothing()
        mocker.ss = 100
        @On(mocker.ss = _).setsField(sField)
        mocker.ss = 123
        Verify.unordered(@Called(mocker.ss = _).times(2))
        @On(mocker.ss).getsField(sField)
        @Assert(mocker.ss, 123)
    }

    @TestCase
    func test06(): Unit {
        let sField = SyntheticField.create(initialValue: "v")
        @On(mocker.vv = _).doesNothing()
        mocker.vv = "vvv"
        @On(mocker.vv = _).setsField(sField)
        mocker.vv = "ssss"
        mocker.vv = "sssss"
        Verify.unordered(@Called(mocker.vv = _).times(3))
        @On(mocker.vv).getsField(sField)
        @Assert(mocker.vv, "sssss")
    }
}
