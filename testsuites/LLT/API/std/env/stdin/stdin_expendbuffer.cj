/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: expendbuffer.txt
// EXEC: %compiler %cmp_opt %stdx-package -o %output %f
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args < expendbuffer.txt 2>&1 | compare %f
// ASSERT: scan-19 123qwer齉1龘2齉3齾Q爩R麤C龗灪龖厵纞虋齉龘齉齾爩麤龗

import std.collection.*
import std.sync.*
import std.env.*

main(): Int64 {
    while (let Some(s) <- getStdIn().readln()) {
        println(s)
    }
    return 0
}
