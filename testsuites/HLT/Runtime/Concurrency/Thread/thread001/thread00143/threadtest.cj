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


var result: Bool = true

main(): Int64 {
    let fut1: Future<Bool> = spawn {
        result = 1 >= 10
        return result
    }
    sleep(Duration.millisecond * 100);
    let fut2: Future<Bool> = spawn {
        result = 1 <= 10
        return result
    }
    sleep(Duration.millisecond * 100);
    let fut3: Future<Bool> = spawn {
        result = 1 != 10
        return result
    }
    sleep(Duration.millisecond * 100);
    let fut4: Future<Bool> = spawn {
        result = 1 == 10
        return result
    }
    sleep(Duration.millisecond * 100);
    if (result) {
        return 1
    }
    return 0
}
