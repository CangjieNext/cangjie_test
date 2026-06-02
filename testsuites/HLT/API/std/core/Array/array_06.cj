/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var a: Rune = r'a'
    var b: Rune = r'b'
    var c: Rune = r'c'
    let arr: Array<Rune> = [a, r'a', b, r'b', c, r'c']
    if (arr[0] == r'a' && arr[2] == r'b' && arr[5] == r'c') {
        return 0
    }
    return 1
}
