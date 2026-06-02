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
    let arrViaFloat64F: Array<Float64> = [110.119, 16.12, 64.5, 956.649]
    let arrViaFloat64S: Array<Float64> = Array<Float64>()
    let arrViaFloat64T: Array<Float64> = Array<Float64>()
    if (!(arrViaFloat64F != arrViaFloat64S)) {
        return 1
    }
    if (arrViaFloat64S != arrViaFloat64T) {
        return 2
    }
    return 0
}
