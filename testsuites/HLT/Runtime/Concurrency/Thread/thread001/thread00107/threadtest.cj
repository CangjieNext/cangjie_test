/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args


var num: Int32 = 0

func add(): Unit {
    num = num + 1
    if (num < 10) {
        let fut: Future<Unit> = spawn {add()}
    }
}

main(): Int64 {
    let fut: Future<Unit> = spawn {add()}
    sleep(Duration.second)
    if (num != 10) {
        return 1
    }
    return 0
}
