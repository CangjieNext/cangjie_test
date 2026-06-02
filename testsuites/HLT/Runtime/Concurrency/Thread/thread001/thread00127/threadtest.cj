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


var sum: Bool = true

func add(a: Bool, b: Bool): Bool {
    sum = a && b
    return sum
}

main(): Int64 {
    let fut1: Future<Bool> = spawn {
        return add(true, false)
        add(true, true)
    }
    sleep(Duration.second);
    if (sum) {
        return 1
    }
    return 0
}
