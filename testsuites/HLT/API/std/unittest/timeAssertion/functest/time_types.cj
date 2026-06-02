/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt

import std.time.*
import std.sync.*

// 用于生成时间相关报告
@Test
public class Test_Time_Function_Parallel {
    @BeforeAll
    public func setup_beforeall(): Unit {
        sleep(Duration.second)
    }

    @AfterAll
    private func setup_afterall(): Unit {
        sleep(Duration.second)
    }

    @BeforeEach
    static func setup_beforeeach(): Unit {
        sleep(0.5 * Duration.second)
    }

    @AfterEach
    static func setup_aftereach(): Unit {
        sleep(0.5 * Duration.second)
    }

    @TestCase[x in [ 0, 1 ] 
]
    @Types[T in<Int64, Float64, String>, U in<Int64, Float64, String>]
    func case001<T, U>(x: Int64): Unit where T <: Hashable, U <: Hashable {
        println(x)
        sleep(Duration.second)
    }
}
