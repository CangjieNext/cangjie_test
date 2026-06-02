/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args --json-configuration="{\"noColor\": true, \"randomSeed\": 42, \"bench\": true}" --no-color=false --random-seed=44

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@Test
public class ModuleJsonConfigurationForUnittest {
    @TestCase
    func user_options_has_higher_priority_then_json(): Unit {
        let config = defaultConfiguration()

        @Expect(config.get<Bool>(KeyNoColor.noColor), false)
        @Expect(config.get<Bool>(KeyBench.bench), true)
        @Expect(config.get<Int64>(KeyRandomSeed.randomSeed), 44)
    }
}
