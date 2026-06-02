/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.collection.*

main() {
    var arrlist01 = ArrayList<Int64>([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    var arrlist02 = ArrayList<Int64>([1, 2, 3])
    arrlist01.remove(3..arrlist01.size)
    if (arrlist01 != arrlist02) {
        return 1
    }
    return 0
}
