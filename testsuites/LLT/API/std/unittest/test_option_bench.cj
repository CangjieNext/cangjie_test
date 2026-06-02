/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt --bench | compare %f
// ASSERT: scan-not case_sayhi2
// ASSERT: scan-not case_sayhi3
// ASSERT: scan case_bench0
// ASSERT: scan case_bench1

import std.unittest.* //testfame
import std.unittest.testmacro.* //macro_Defintion
import std.sync.*
import std.time.*

func ssssssssssssssssssssssss(): Int64 {
    return 12
}

@Test
@Configure[minDuration: 0.1 * Duration.second, warmup: 0.01 * Duration.second]
public class TestCCC {
    @TestCase
    func sayhi2(): Unit {
        print("hi2")
        let s = [1, 2]
        s[1]
        print("case_sayhi2")
    }

    @TestCase
    func sayhi3(): Unit {
        @Expect(ssssssssssssssssssssssss(), 11)
        @Expect([1,2,3], [1,2])
        print("case_sayhi3")
    }

    @Bench[10]
    @TestCase
    func ttt(): Unit {
        var s = "0"
        for (i in 1..1000) {
            s = s + i.toString()
        }
    }

    @Bench[0]
    @TestCase
    func sayhiBench0(): Unit {
        sleep(Duration.millisecond * 50)
        println("case_bench0")
    }

    @Bench[1]
    @TestCase
    func sayhiBench1(): Unit {
        sleep(Duration.millisecond * 50)
        println("case_bench1")
    }
}
