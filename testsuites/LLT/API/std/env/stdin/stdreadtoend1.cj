/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: stdinreadtoend.txt
// EXEC: %compiler %cmp_opt %stdx-package -o %output %f
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args < stdinreadtoend.txt 2>&1 | compare %f
// ASSERT: scan 123qwer齉1龘2齉3齾Q爩R麤C龗灪龖厵纞虋齉龘齉齾爩麤龗
// ASSERT: scan abc
// ASSERT: scan end
internal import std.collection.*
internal import std.sync.*
internal import std.env.*

main(): Int64 {
    var line = getStdIn().readToEnd()
    print(line);
    return 0
}
