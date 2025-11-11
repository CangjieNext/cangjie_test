/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// RUN-EXEC-PIPE-1: %export cjEnableGC=0 && %run %run_opt %output %run_utest_opt %run_args --bench --no-color 2>&1 | compare %f
// ASSERT: scan Out of memory

var o = Object()

@Test
class BenchGCLight {
    @Bench
    func foo() {
        o = Box(1)
    }
}