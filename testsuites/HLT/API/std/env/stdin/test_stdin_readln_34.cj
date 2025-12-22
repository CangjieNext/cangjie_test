/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt -o %output %f
// ((not Windows or OHOS) and not iOS) RUN-EXEC-PIPE-0: echo 仓颉test\x00abc > input.txt && %run %run_opt %output %run_args < input.txt 2>&1 | compare %f
// ((not Windows or OHOS) and not iOS) ASSERT: scan Some(仓颉testx00abc)

import std.env.*

main() {
    let c = getStdIn().readln()
    println(c)
    return 0
}
