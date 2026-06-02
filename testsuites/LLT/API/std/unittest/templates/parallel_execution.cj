/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args --no-color 2>&1 --parallel=10 | compare %f
// ASSERT: scan-1 case04case02case03case01

import std.time.*

func ord1() {}

func ord2() {
    sleep(Duration.second * 2)
}

func ord3() {
    sleep(Duration.second * 4)
}

func ord4() {
    sleep(Duration.second * 6)
}

@TestTemplate
abstract class Template {
    @TestCase
    func case01() {
        ord4()
        print("case01", flush: true)
    }

    @TestCase
    func case02() {
        ord2()
        print("case02", flush: true)
    }
}

@Test
@Parallel
class Tests <: Template {
    @TestCase
    func case03() {
        ord3()
        print("case03", flush: true)
    }

    @TestCase
    func case04() {
        ord1()
        print("case04", flush: true)
    }
}
