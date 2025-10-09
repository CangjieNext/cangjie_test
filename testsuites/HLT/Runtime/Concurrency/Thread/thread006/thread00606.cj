/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// (not CJNATIVE) RUN-EXEC: export JETVMPROP=-Djet.cj.use.fibers && %run %run_opt %output %run_args

func add(a: Int64, b: Int64): Int64 {
    return a - b
}

main() {
    let res = spawn {
        add(1, 1)
        sleep(Duration.second * 1)
    }
    try {
        res.get(1000000 * Duration.nanosecond)
    } catch (e: TimeoutException) {
        return 0
    }
    return 1
}
