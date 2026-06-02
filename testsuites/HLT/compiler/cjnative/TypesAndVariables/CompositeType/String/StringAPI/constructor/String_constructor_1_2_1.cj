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

func run(): Int64 {

    //var c1: Array<Rune> = ['']
    var c2: Array<Rune> = [r'A', r'a', r'B', r'b', r'f', r'F']
    var c3: Array<Rune> = [r'1', r'2', r'3', r'7', r'9']
    var c4: Array<Rune> = [r'仓', r'颉', r'编', r'程', r'语', r'言']
    var c5: Array<Rune> = [r'\n', r'\t', r'\b', r'\\']
    var c6: Array<Rune> = [r'仓', r'颉', r'b', r'f', r'F', r'3', r'7', r'9', r'\n', r'\t', r'\b', r'\\']

    var s22: String = String(c2)[0..1]
    var s222: String = String(c2)[3..5]
    var s2222: String = String(c2)[6..6]

    var s33: String = String(c3)[0..1]
    var s333: String = String(c3)[3..5]
    var s3333: String = String(c3)[5..5]

    var s44: String = String(c4)[0..3]
    var s444: String = String(c4)[9..15]
    var s4444: String = String(c4)[18..18]

    var s55: String = String(c5)[0..1]
    var s555: String = String(c5)[2..4]
    var s5555: String = String(c5)[4..4]

    var s66: String = String(c6)[0..3]
    var s666: String = String(c6)[9..11]
    var s6666: String = String(c6)[16..16]

    if (s22 != "A" || s222 != "bf" || s2222 != "") {
        return 1
    }
    if (!(s33 == "1" && s333 == "79" && s3333 == "")) {
        return 1
    }
    if (!(s44 == "仓" && s444 == "程语" && s4444 == "")) {
        return 1
    }
    if (!(s55 == "\n" && s555 == "\b\\" && s5555 == "")) {
        return 1
    }
    if (!(s66 == "仓" && s666 == "37" && s6666 == "")) {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
