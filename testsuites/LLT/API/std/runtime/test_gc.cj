/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output --test
// EXEC: %run %run_opt %output %run_args

import std.runtime.*

@When[backend == "cjnative"]
@Test
public class GCConfig {
    @TestCase
    func setGCThreshold(): Unit {
        SetGCThreshold(0)
        SetGCThreshold(1)
        SetGCThreshold(1_000)
        SetGCThreshold(1_000_000)
        SetGCThreshold(1_000_000_000)
        SetGCThreshold(UInt64.Max)

        setGCThreshold(0)
        setGCThreshold(1)
        setGCThreshold(1_000)
        setGCThreshold(1_000_000)
        setGCThreshold(1_000_000_000)
        setGCThreshold(UInt64.Max)
    }
}
