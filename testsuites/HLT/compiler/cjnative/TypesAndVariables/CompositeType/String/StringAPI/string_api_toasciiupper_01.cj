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

main(): Int64 {
    var r1 = "ABCDE".toAsciiUpper()
    var r2 = "abcde".toAsciiUpper()
    var r3 = "仓颉字体".toAsciiUpper()
    var r4 = String().toAsciiUpper()
    var a5: Array<UInt8> = [65, 32, 66, 99]
    var r5 = String.fromUtf8(a5[0..4]).toAsciiUpper()
    var r6 = "abc,abc!abc1abc abc$abc中abc".toAsciiUpper()
    var r7 = "çabcçabc".toAsciiUpper()
    var r8 = "abc\naBc".toAsciiUpper()
    if (r1 != "ABCDE") {
        return 1
    }
    if (r2 != "ABCDE") {
        return 2
    }
    if (r3 != "仓颉字体") {
        return 3
    }
    if (r4 != "") {
        return 4
    }
    if (r5 != "A BC") {
        return 5
    }
    if (r6 != "ABC,ABC!ABC1ABC ABC$ABC中ABC") {
        return 6
    }
    if (r8 != "ABC\nABC") {
        return 7
    }
    return 0
}
