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
    var s1: String = "A3bc"
    var s2: String = "1w23"
    var s3: String = "仓_颉"
    var s4: String = "\tt\n\b"
    var s5: String = "Ambc1m23仓m颉\tm\n\b"

    var cs11 = s1.split("3", 33)

    var cs22 = s2.split("w", 78)

    var cs33 = s3.split("_", 33)

    var cs44 = s4.split("t", 89)

    var cs55 = s5.split("m", 100)

    if (!(cs11[0] == "A" && cs11[1] == "bc")) {
        return 1
    }
    if (cs22[0] != "1" || cs22[1] != "23") {
        return 1
    }

    if (cs33[0] != "仓" || cs33[1] != "颉") {
        return 1
    }

    if (cs44[0] != "\t" || cs44[1] != "\n\b") {
        return 1
    }

    if (cs55[0] != "A" || cs55[1] != "bc1"
        || cs55[2] != "23仓" || cs55[3] != "颉\t" || cs55[4] != "\n\b") {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
