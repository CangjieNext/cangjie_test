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

/*
    TestPoint: 测试未赋值变量在一些表达式结构中的使用
 */

main() {
    var a: Int64
    if (let b <- 1 && let a <- b) {
        a |> println
    }
    a = 0
    a
}
