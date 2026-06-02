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
struct R {
    R(var ra!: Int64 = 0, let rb!: Int64 = 0) {
    }
}

main() {
    var arr: Array<R> = [R(ra: 0, rb: 0), R(ra: 1, rb: 1)]
    var b = arr
    b[0] = R(ra: 1, rb: 1)
    if (arr[0].ra != 1 || arr[0].rb != 1 || arr[1].ra != 1 || arr[1].rb != 1) {
        return 2
    }
    return 0
}
