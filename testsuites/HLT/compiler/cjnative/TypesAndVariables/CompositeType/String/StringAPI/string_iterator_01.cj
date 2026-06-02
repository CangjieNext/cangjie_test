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

main() {
    var s = "hello, world"
    var res = ""
    var utf8 = s.toArray()
    for (u in utf8) {
        res = res + "${u}"
    }
    for (u in utf8) {
        res = res + "${u}"
    }
    if (res != "10410110810811144321191111141081001041011081081114432119111114108100") {
        return 1
    }
    return 0
}
