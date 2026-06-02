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
    return 10
}

func test1() {
    var a = 10
    while (test() < 10) {
        a = 30
    }
    if (a + 10 < 30) {
        return 0
    } else {
        return 1
    }
}

main() {
    return test1()
}
