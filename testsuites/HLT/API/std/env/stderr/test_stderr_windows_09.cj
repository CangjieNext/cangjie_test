/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan abcedf仓颉鸿蒙對應三個繁體字

import std.env.*

main() {
    getStdErr().write("abcedf")
    getStdErr().write("仓颉鸿蒙")
    getStdErr().write("對應三個繁體字")
    getStdErr().flush()
    return 0
}
