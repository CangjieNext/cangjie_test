/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC-PIPE-1: %run %run_opt %output %run_utest_opt --no-color | compare %f
// ASSERT: scan Expect Failed: `(0 == 1 == true)`
// ASSERT: scan Expect Failed: `(x != 3 == true)`
// ASSERT: scan Expect Failed: `(x * 2 != y == true)`
// ASSERT: scan Expect Failed: `(x.size != y == true)`
// ASSERT: scan with randomSeed = 1
// ASSERT: scan foo4: 0 4
// ASSERT: scan foo4: 0 5
// ASSERT: scan foo4: 1 4
// ASSERT: scan foo4: 1 5

import std.unittest.*
import std.unittest.testmacro.*

@Test
@Configure[randomSeed: 1]
class FooTest {
    @TestCase
    func foo1(): Unit {
        println("foo1")
        @Expect(0 == 1)
    }

    @TestCase[x in [ 0, 1, 2, 3 ] 
]
    func foo2(x: Int64): Unit {
        println("foo2: ${x}")
        @Expect(x != 3)
    }

    @TestCase[x in [ 0, 1, 2, 3 ], 
 y in [ 4, 5, 6, 7 ] 
]
    func foo3(x: Int64, y: Int64): Unit {
        println("foo3: ${x} ${y}")
        @Expect(x * 2 != y)
    }

    @TestCase[x in(0 .. 2), 
 y in [ 4, 5 ] 
]
    func foo4(x: Int64, y: Int64): Unit {
        println("foo4: ${x} ${y}")
    }

    @TestCase[x in random<String>(), 
 y in random<Int64>(), 
]
    @Configure[generationSteps: 500]
    func foo5(x: String, y: Int64): Unit {
        @Expect(x.size != y)
    }
}
