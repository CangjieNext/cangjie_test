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
    var s2: String = "1M23"
    var s3: String = "仓_颉"
    var s4: String = "\t5\n\b"
    var s5: String = "Awbc1w23仓w颉\tw\n\b"

    var cs1 = s1.split("_", 1)
    var cs11 = s1.split("_", 2)

    var cs2 = s2.split("M", 1)
    var cs22 = s2.split("M", 2)

    var cs3 = s3.split("_", 1)
    var cs33 = s3.split("_", 2)

    var cs4 = s4.split("5", 1)
    var cs44 = s4.split("5", 2)

    var cs5 = s5.split("w", 1)
    var cs55 = s5.split("w", 5)

    if (!(cs1[0] == "A_bc" && cs11[0] == "A" && cs11[1] == "bc")) {
        return 1
    }
    if (cs2[0] != "1M23" || cs22[0] != "1" || cs22[1] != "23") {
        return 1
    }

    if (cs3[0] != "仓_颉" || cs33[0] != "仓" || cs33[1] != "颉") {
        return 1
    }

    if (cs4[0] != "\t5\n\b" || cs44[0] != "\t" || cs44[1] != "\n\b") {
        return 1
    }

    if (cs5[0] != "Awbc1w23仓w颉\tw\n\b" || cs55[0] != "A" || cs55[1] != "bc1"
        || cs55[2] != "23仓" || cs55[3] != "颉\t" || cs55[4] != "\n\b") {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
