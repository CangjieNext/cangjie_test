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

// lambda表达式中含有可供类型推断的表达式--没有else的if表达式

main() {
    let f1 = {
        x => if (x) { // x为bool
            print("abc")
        }
    }

    if (f1 is (Bool) -> Unit) {
        return 0
    }
    return 1
}
