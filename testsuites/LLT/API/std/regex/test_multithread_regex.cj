/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt

import std.regex.*
import std.sync.*
import std.random.*

@Test
public class MultiThreadRegexTest {
    @TestCase
    func multiThreadRegex(): Unit {
        let regex = Regex(#"^\d+$"#)
        for (_ in 1..=100) {
            let rand = Random()
            var fut = spawn {
                for (_ in 1..=10000) {
                    let r = rand.nextUInt64()
                    let mc = regex.matcher(r.toString()).allCount()
                    if (mc != 1) {
                        @Assert(false)
                    }
                }
            }
            fut.get()
        }
    }
}
