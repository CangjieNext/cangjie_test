/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1

func run(): Int64 {
    var array1: Array<Rune> = [r'a', r'b', r'c', r'd']
    array1[0] = r'v'
    array1[3] = r'g'
    var array2 = Array<Rune>(2, repeat: r'a')
    var array3: Array<Array<Rune>> = [[r'a', r'b', r'c'], [r'd', r'f']]
    var res1 = array1[0]
    var res2 = array1[3]
    var res3 = array2[0]
    var res4 = array3[1][0]
    if (res1 == r'v' && res2 == r'g' && res3 == r'a' && res4 == r'd') {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
