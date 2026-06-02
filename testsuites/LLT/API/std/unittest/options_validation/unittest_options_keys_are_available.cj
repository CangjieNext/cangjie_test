/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %cmp_utest_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args --no-color

import std.random.*

@Test
func test_KeyRandom() {
    let conf = Configuration()

    conf.set(KeyRandom.random, Random())
}

@Test
func test_KeyTags() {
    let conf = Configuration()

    conf.set(KeyTags.tags, ["aa"])
    let value = conf.get(KeyTags()).getOrThrow()
    @PowerAssert(value == ["aa"])
}

@Test
func test_KeyRandomSeed() {
    let conf = Configuration()

    conf.set(KeyRandomSeed.randomSeed, 43)
    let value = conf.get(KeyRandomSeed()).getOrThrow()
    @PowerAssert(value == 43)
}
