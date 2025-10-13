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

main(): Int64 {
    return run()
}

func run(): Int64 {
    if (Foo() == ()) {
        return 0
    }
    return 1
}

var hundred = 0

func Foo(c!: Unit = while (hundred < 10) {
        hundred++;
        if (hundred > 5) {
            break
        }
    }): Unit {
    return c
}
