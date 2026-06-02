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

// lambda表达式中含有可供类型推断的表达式--关系操作符tuple
main() {
    let f1 = {tuple1 => tuple1 == (1, 2)}
    let f2 = {tuple2 => tuple2 != (1, 2)}
    if (f1 is ((Int64, Int64)) -> Bool && f2 is ((Int64, Int64)) -> Bool) {
        return 0
    }
    return 1
}
