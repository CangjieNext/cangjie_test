/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2 
// EXEC-PIPE-1: %compiler %cmp_opt %cmp_utest_opt --mock=off %f -o %output 2>&1 | compare %f

import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

public class Example {
    public func a(): String {
        "a"
    }
    public func b(): String {
        "b"
    }
    public func c(): String {
        "c"
    }
}

@Test
public class Test_CJC_Mock_Option {
    let exa = mock<Example>()

    @TestCase
    func test01(): Unit {
        @On(exa.a()).returns("a")
        exa.a()
    }
}
// ASSERT: scan sema_mock_disabled
