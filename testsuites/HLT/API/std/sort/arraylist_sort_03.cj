/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*
import std.sort.SortExtension

main(): Int64 {
    var a1 = ArrayList<String>(["Google", "Google", "Apple", "Apple", "Microsoft", "Microsoft"])
    var a2 = ArrayList<String>(["Google", "Google", "Apple", "Apple", "Microsoft", "Microsoft"])
    var a3 = ArrayList<String>(["Google", "Google", "Apple", "Apple", "Microsoft", "Microsoft"])
    a1.sort()
    a2.sort(stable: false)
    a3.sort(stable: true)
    if (a1[0] != "Apple" || a1[1] != "Apple" || a1[2] != "Google" || a1[3] != "Google" || a1[4] != "Microsoft" ||
        a1[5] != "Microsoft") {
        return 1
    }
    if (a2[0] != "Apple" || a2[1] != "Apple" || a2[2] != "Google" || a2[3] != "Google" || a2[4] != "Microsoft" ||
        a2[5] != "Microsoft") {
        return 2
    }
    if (a3[0] != "Apple" || a3[1] != "Apple" || a3[2] != "Google" || a3[3] != "Google" || a3[4] != "Microsoft" ||
        a3[5] != "Microsoft") {
        return 1
    }
    return 0
}
