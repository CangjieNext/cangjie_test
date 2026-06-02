/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
main() {
    let arrViaInt64F: Array<Int64> = [16, -12, 9621]
    let arrViaInt64S: Array<Int64> = Array<Int64>()
    let arrViaInt64T: Array<Int64> = Array<Int64>()
    if (arrViaInt64F == arrViaInt64S) {
        return 1
    }
    if (!(arrViaInt64S == arrViaInt64T)) {
        return 2
    }
    return 0
}
