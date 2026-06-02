/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (JS) EXEC: cp -r %stdpath .
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

func access() {
    let array8: ArrayList<Int64> = ArrayList<Int64>([1, 8, 0, 1, 0])
    for (num in array8) {
        print("${num}") // output: 18010
    }
}

main() {
    access()
    let array9: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2, 3, 4, 5])
    let size1 = array9.size // size1 = 6
    return 0
}
