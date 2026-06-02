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
    let arr = [0, 1, 2, 3, 4]
    for (i in arr) {
        print("${i}") // output: 01234
    }
    let intArr: Array<Int32> = [0, 1, 2, 3, 4]
    for (item in intArr) {
        print("${item}") // output: 01234
    }
    let intRange = 0..5
    for (number in intRange where (number > 2)) {
        print("${number}") // output: 34
    }

    return 0
}
