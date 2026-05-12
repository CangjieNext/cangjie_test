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

import std.unittest.*
import std.unittest.testmacro.*
import std.core.*

main(): Int64 {
    var var1: Rune = r'👆'
    var var2: Rune = r'😈'
    var var3: Rune = r'👀'
    var var4: Rune = r'💯'
    var var5: Rune = r'🦴'
    var var6: Rune = r'👪'
    var var7: Rune = r'🦗'
    var var8: Rune = r'🤺'
    var var9: Rune = r'🦾'

    println("var1:${var1}, var2:${var2},var3:${var3},var4:${var4},var5:${var5},var6:${var6},var7:${var7},var8:${var8},var9:${var9}")
    

    let a = unsafe {var1.toString().rawData()}.map{i => Int64(i)}
    let b = [0xF0, 0x9F,0x91, 0x86]
    @Expect(a,b)

    //用码点作为检查，仓颉会按UTF-16转换
    //👆-> 码点：1f446 -> UTF-16转换:\uf09f\u9186 -> UTF-8转换:\ud8d3\udc46

    let arr: Array<Rune> = [var1, var2, var3, var4, var5, var6, var7, var8, var9]
    if (arr[0] == r'\u{1f446}' && arr[1] == r'\u{1f608}' && arr[2] == r'\u{1f440}' && arr[3] == r'\u{1f4af}' && arr[4] == r'\u{1f9b4}' && arr[5] == r'\u{1f46a}' && arr[6] == r'\u{1f997}' &&arr[7] == r'\u{1f93a}' &&arr[8] == r'\u{1f9be}') {
        return 0
    }
    return 1
}




