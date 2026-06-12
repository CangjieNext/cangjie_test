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
    var var1: Rune = r'\b'
    var var2: Rune = r'\f'
    var var3: Rune = r'\n'
    var var4: Rune = r'\r'
    var var5: Rune = r'\t'
    var var6: Rune = r'\v'
    var var7: Rune = r'\\'
    var var8: Rune = r'\''
    var var9: Rune = r'\"'

    println("var1:${var1}")
    println("var2:${var2}")
    println("var3:${var3}")
    println("var4:${var4}")
    println("var5:${var5}")
    println("var6:${var6}")
    println("var7:${var7}")
    println("var8:${var8}")
    println("var9:${var9}")

    let arr: Array<Rune> = [var1, var2, var3, var4, var5, var6, var7, var8, var9]
    if (arr[0] == r'\b' && arr[1] == r'\f' && arr[2] == r'\n' && arr[3] == r'\r' && arr[4] == r'\t' && arr[5] == r'\v' && arr[6] == r'\\' &&arr[7] == r'\'' &&arr[8] == r'\"') {
        return 0
    }
    return 1
}