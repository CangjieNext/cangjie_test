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
    var s1: String = ""
    var s2: String = "Aabcd"
    var s3: String = "123456"
    var s4: String = "仓颉桌子电脑椅子"
    var s5: String = "\n\t\b\\"
    //var s6: String = "a1仓\n"

    var cs1 = s1.toRuneArray()
    var cs2 = s2.toRuneArray()
    var cs3 = s3.toRuneArray()
    var cs4 = s4.toRuneArray()
    var cs5 = s5.toRuneArray()
    var cs6 = "a1仓\n".toRuneArray()

    if (cs1.size != 0) {
        return 1
    }

    if (cs2[0] != r'A' || cs2[1] != r'a' || cs2[2] != r'b' || cs2[3] != r'c' || cs2[4] != r'd') {
        return 1
    }
    if (cs3[0] != r'1' || cs3[1] != r'2' || cs3[2] != r'3' || cs3[3] != r'4' || cs3[4] != r'5' || cs3[5] != r'6') {
        return 1
    }
    if (cs4[0] != r'仓' || cs4[1] != r'颉' || cs4[2] != r'桌' || cs4[3] != r'子' || cs4[4] != r'电'
        || cs4[5] != r'脑' || cs4[6] != r'椅' || cs4[7] != r'子') {
        return 1
    }
    if (cs5[0] != r'\n' || cs5[1] != r'\t' || cs5[2] != r'\b' || cs5[3] != r'\\') {
        return 1
    }
    if (cs6[0] != r'a' || cs6[1] != r'1' || cs6[2] != r'仓' || cs6[3] != r'\n') {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
