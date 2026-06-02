/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.unittest.*
import std.unittest.testmacro.*
import std.sync.*
import std.time.*

/**
 * Expect tick == expectTick
 *    -ε <= tick - expectTick <= ε
 */
let EPSILON = Duration.millisecond * 50

func expectTick(tick: MonoTime, expectTick: MonoTime): Unit {
    let expectZero = tick - expectTick
    @Expect(expectZero >= Duration.Zero - EPSILON)
    @Expect(expectZero <= EPSILON)
}
