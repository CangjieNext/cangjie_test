/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args --no-color=false --random-seed=44 --test-naming-facade-strategy-adapter="boop" --abstract-puppies-threshold=3.14 --

import std.unittest.*
import std.unittest.testmacro.*
import std.fs.*

@UnittestOption[String](testNamingFacadeStrategyAdapter)
@UnittestOption[Float64](abstractPuppiesThreshold)

@Test
public class BasicConfigurationTest {
    @TestCase
    func defaults(): Unit {
        let config = defaultConfiguration()

        @Expect("${config}".contains("testNamingFacadeStrategyAdapter:boop"))
        @Expect("${config}".contains("abstractPuppiesThreshold:3.14"))

        @Expect(config.get<Bool>(KeyNoColor.noColor), false)
        @Expect(config.get<Int64>(KeyRandomSeed.randomSeed), 44)
        // do not try this at home
        @Expect(config.removeByName<Bool>("noColor"), Some(false))
        @Expect(config.removeByName<Bool>("noColor"), None)

        @Expect(config.remove(KeyNoColor.noColor), None)
        @Expect(config.remove(KeyRandomSeed.randomSeed), Some(44))
        @Expect(config.remove(KeyRandomSeed.randomSeed), None)       
    }
}
