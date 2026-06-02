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

func test() {
    var a = "HEllO"
    var b: UInt8 = 0
    for (i in a where Int64(i) == 72) {
        b += i
        if (Int64(b) == 72) {
            break
        }
    }
    return b
}

main() {
    if (Int64(test()) == 72) {
        return 0
    } else {
        return 1
    }
    return 1
}
