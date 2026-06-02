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

enum E1 {
    TestA | TestB | TestC
}

enum E2 {
    TestA | TestB
}

main(): Int64 {
    let f = {
        a => match (a) {
            case E1.TestA => ()
            case TestB => ()
            case _ => ()
        }
    }
    if (f is (E1) -> Unit) {
        return 0
    }
    return 1
}
