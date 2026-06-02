/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// (not OHOS)RUN-EXEC-PIPE: %run %run_opt %output "" | compare %f
// (not OHOS)ASSERT: scan []
// (OHOS)RUN-EXEC-PIPE: %run %run_opt %output %run_args arg1 arg2 | compare %f
// (OHOS)ASSERT: scan [arg1, arg2]

import std.process

main() {
    let args = process.Process.current.arguments
    println(args)
    0
}
