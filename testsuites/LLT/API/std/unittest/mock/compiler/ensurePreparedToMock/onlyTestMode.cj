/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args

// The test checks if `EnsurePreparedToMock` usage is interpreted as a "mock usage"
// and based on this fact, needed mock preparations are performed

public func a(): String {
    "original"
}

let f = @EnsurePreparedToMock {=> return (a())}
