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

// lambda表达式中含有可供类型推断的表达式--match表达式1

let f1 = {
    x => match (x) {
        case Some(v) => v + 1
        case None => 0
    }
}

main() {
    if (f1 is ((Option<Int64>) -> Int64)) {
        return 0
    }
    return 1
}
