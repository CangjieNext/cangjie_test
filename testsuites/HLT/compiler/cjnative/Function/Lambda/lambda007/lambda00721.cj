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

// lambda表达式中含有可供类型推断的表达式--算数操作符**

main() {
    let f1 = {x => x ** 2}
    let f2 = {x => x ** 2.5}
    let f3 = {x => 3 ** x}
    let f4 = {x => 1.5 ** x}
    if (f1 is (Float64) -> Float64 && f2 is (Float64) -> Float64 && f3 is (UInt64) -> Int64 && f4 is (Int64) -> Float64) {
        return 0
    }
    return 1
}
