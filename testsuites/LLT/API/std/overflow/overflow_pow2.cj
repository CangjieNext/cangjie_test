/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args

let data: Array<(Int64, UInt64)> = [
    (5777523539921853504, 10256004525803361777),
    (-1138438814981368515, 13582745572890801796),
    (3549292889148046380, 3599698824668116394)
]

main() {
    var count = 0
    for (t in data) {
        let (x, y) = t
        try {
            let res = x ** y
        } catch (e: OverflowException) {
            count++
        }
    }
    if (count != 3) {
        return 1
    }
    return 0
}
