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
    var s1: String = "A_bc"
    var s2: String = "1923"
    var s3: String = "仓RR颉"
    var s4: String = "\t\r\n\b"
    var s5: String = "A\u{fffe}bc1\u{fffe}23仓\u{fffe}颉\t\u{fffe}\n\b"

    let s6 = "wwwww"
    var s7 = "kkkkkkkk"

    let s8 = "kkkkkkkkk"

    var cs1 = s1.split("_")
    var cs2 = s2.split("9")
    var cs3 = s3.split("RR")
    var cs4 = s4.split("\r")
    var cs5 = s5.split("\u{fffe}")

    let cs6 = s6.split("ww")
    let cs7 = s7.split("kkk")

    let cs8 = s8.split("k")
    let cs88 = s8.split("kk")
    let cs888 = s8.split("kkk")
    let cs8888 = s8.split("kkkkk")

    if (!(cs1[0] == "A" && cs1[1] == "bc" && cs2[0] == "1" && cs2[1] == "23")) {
        return 1
    }
    if (!(cs3[0] == "仓" && cs3[1] == "颉" && cs4[0] == "\t" && cs4[1] == "\n\b")) {
        return 1
    }

    if (!(cs5[0] == "A" && cs5[1] == "bc1" && cs5[2] == "23仓" && cs5[3] == "颉\t" && cs5[4] == "\n\b")) {
        return 1
    }

    if (!(cs6[0] == "" && cs6[1] == "" && cs6[2] == "w")) {
        return 1
    }
    if (!(cs7[0] == "" && cs7[1] == "" && cs7[2] == "kk")) {
        return 1
    }

    if (cs8[0] != "" || cs8[1] != "" || cs8[2] != "" || cs8[3] != "" || cs8[4] != "" || cs8[5] != ""
        || cs8[6] != "" || cs8[7] != "" || cs8[8] != "" || cs8[9] != "") {
        return 1
    }
    if (cs88[0] != "" || cs88[1] != "" || cs88[2] != "" || cs88[3] != "" || cs88[4] != "k") {
        return 1
    }
    if (cs888[0] != "" || cs888[1] != "" || cs888[2] != "" || cs888[3] != "") {
        return 1
    }
    if (cs8888[0] != "" || cs8888[1] != "kkkk") {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
