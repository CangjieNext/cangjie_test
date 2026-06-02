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

func test(arr: Array<(Array<Int64>, Array<Int64>)>) {
    var s = 0
    for (x in arr[0][0]) {
        s += x
    }
    for (x in arr[0][1]) {
        s += x
    }
    s
}

main() {
    var a = test(([1, 2, 3], [1, 2, 3]))
    if (a == 12) {
        return 0
    }
    return 1
}
