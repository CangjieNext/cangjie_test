/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

const e1 = 1
// const arr1 = [e1] 
const tup1 = (e1, e1)
const tup2 = (1, 0)
const tup3 = (1, 2, 3, 4, 5, 6, 7, 8)
const tup4 = (1u32, 2, -3, "ab", 5, 6, r'a', 8)
const tup5 = (2 ** 3, !true, true && true)
const tup6 = (1, (1, "a"))
// const arr2 = [0.0, 1.0, 3.14]
// const arr3 = ["1", "a", "5"]
// const arr4: Array<UInt8> = [1, 2, 3, 4, 5]

main() {
    const _tup1 = (e1, e1)
    const _tup2 = (1, 0)
    const _tup3 = (1, 2, 3, 4, 5, 6, 7, 8)
    const _tup4 = (1u32, 2, -3, "ab", 5, 6, r'a', 8)
    const _tup5 = (2 ** 3, !true, true && true)
    const _tup6 = (1, (1, "a"))
    0
}
