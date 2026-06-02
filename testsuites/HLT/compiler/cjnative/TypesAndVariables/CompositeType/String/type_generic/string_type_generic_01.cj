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
    var array1: Array<String> = ["a", "b", "c", "d"]
    array1[0] = "head"
    array1[3] = "end"
    var array2 = Array<String>(2, repeat: "a")
    var array3: Array<Array<String>> = [["a", "b", "c"], ["d", "f"]]
    var res1 = array1[0]
    var res2 = array1[3]
    var res3 = array2[0]
    var res4 = array3[1][0]
    if (res1 == "head" && res2 == "end" && res3 == "a" && res4 == "d") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
