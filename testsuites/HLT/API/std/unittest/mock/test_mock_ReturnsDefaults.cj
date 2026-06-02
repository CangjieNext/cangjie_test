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

open class test_class {
    var num0: Int64 = 0
    public var num1: Int64 = 100
    let num2: Int64 = 200
    public var str1: String = "a"
    let boolean: Bool = true
    let float1: Float64 = 10.0
}

class test_class_inherit <: test_class {
    var num3: Int64 = 300
    public prop num4: Int64 {
        get() {
            0
        }
    }
    public mut prop num5: Int64 {
        get() {
            500
        }
        set(v) {}
    }
    var tuple1 = (0, 0)
    var range1 = 0..10 : 1
}

interface test_interface {
    prop num6: Int64
    mut prop num7: Int64
}

@Test
public class Test_Mock_ReturnsDefaults {
    @TestCase
    func test_from_class(): Unit {
        let mocker = mock<test_class>(ReturnsDefaults)
        @Expect(mocker.num0, 0)
        @Expect(mocker.num1, 0)
        @Expect(mocker.num2, 0)
        @Expect(mocker.str1, "")
        @Expect(mocker.boolean, false)
        @Expect(mocker.float1, 0.0)
    }

    @TestCase
    func test_from_class_inherit(): Unit {
        let mocker = mock<test_class_inherit>(ReturnsDefaults)
        @Expect(mocker.num0, 0)
        @Expect(mocker.num1, 0)
        @Expect(mocker.num2, 0)
        @Expect(mocker.str1, "")
        @Expect(mocker.boolean, false)
        @Expect(mocker.float1, 0.0)

        @Expect(mocker.num3, 0)
        @Expect(mocker.num4, 0)
        @Expect(mocker.num5, 0)
    }

    @TestCase
    func test_from_interface(): Unit {
        let mocker = mock<test_interface>(ReturnsDefaults)
        @Expect(mocker.num6, 0)
        @Expect(mocker.num7, 0)
    }
}
