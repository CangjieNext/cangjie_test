/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.random.*

main() {
    var count: UInt64 = 0 //记录结果正确次数
    var n: UInt64 = 200 //定义循环次数
    var seed: UInt64 = 65
    var r1 = Random(seed)

    var r2 = Random(seed)
    for (i in 0..n) {
        if (r1.nextInt8() == r2.nextInt8()) {
            count += 1
        }
    }
    if (count != n) {
        return 1
    }

    return 0
}
