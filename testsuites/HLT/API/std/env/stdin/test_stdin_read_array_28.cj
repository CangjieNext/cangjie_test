/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// (not iOS) RUN-EXEC-PIPE-0: echo a > input.txt && %run %run_opt %output %run_args < input.txt 2>&1 | compare %f
// ASSERT: scan 2
// (not Windows or OHOS)ASSERT: scan [97, 10]
// (Windows and not OHOS)ASSERT: scan [97, 32]

import std.env.*

main() {
    var arr: Array<Byte> = Array(2, repeat: 0)
    let c = getStdIn().read(arr)
    println(c)
    println(arr)
    return 0
}
