/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler -O2 %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan case1 parameter: x = 9
// ASSERT: scan case1 parameter: x = 9
// ASSERT: scan case3 parameter: x = 1
// ASSERT: scan case3 parameter: y = a
// ASSERT: scan case3 parameter: x = 2

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*

@Test
class Test_GenerationSteps {
    var count = AtomicInt64(0)
    var num = AtomicInt64(0)
    var nummax = AtomicInt64(0)

    @TestCase[x in 0 .. 10, 
 y in 0 .. 10: 2 
]
    @Configure[generationSteps: 0]
    func case1(x: Int64, y: Int64): Unit {
        println("case1 parameter: x = ${x}")
        println("case1 parameter: y = ${y}")
    }

    @TestCase[x in 0 .. 10, 
 y in 0 .. 10: 2 
]
    @Configure[generationSteps: -1]
    func case2(x: Int64, y: Int64): Unit {
        println("case2 parameter: x = ${x}")
        println("case2 parameter: y = ${y}")
    }

    @TestCase[x in [ 1, 2, 3 ], 
 y in [ r'a', r'b', r'c' ] 
]
    @Configure[generationSteps: 1]
    func case3(x: Int64, y: Rune): Unit {
        println("case3 parameter: x = ${x}")
        println("case3 parameter: y = ${y}")
    }

    @TestCase[x in [ 1, 2, 3, 4, 5 ], 
 y in [ r'a', r'b', r'c', r'd', r'e' ], 
 z in random() 
]
    @Configure[generationSteps: 20000]
    func case4(x: Int64, y: Rune, z: Int64): Unit {
        count.fetchAdd(1)
    }

    @TestCase
    func case4_0(): Unit {
        @Assert(count.load(), 20000)
    }
}
