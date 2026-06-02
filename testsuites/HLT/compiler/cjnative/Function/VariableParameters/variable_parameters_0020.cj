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

enum A {
    A1 | A2 | A3
}

func test(arr: Array<A>) {
    for (x in arr) {
        if (!(x is A)) {
            return false
        }
    }
    true
}

main() {
    var a = test(A1, A2, A3)
    if (a) {
        return 0
    }
    return 1
}
