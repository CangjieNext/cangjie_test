/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan class 'ArgOpt' is deprecated. Use global function `public func parseArguments(args: Array<String>, specs: Array<ArgumentSpec>): ParsedArguments` instead.

import std.argopt.*

main(): Unit {
    ArgOpt("dsf")
    ArgOpt(["dsf"])
    ArgOpt("", ["dsf"])
    ArgOpt([""], "", ["dsf"])
}
