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
    var a: Option<Int32> = Some<Int32>(1)
    var b: Option<Int32> = None<Int32>
    let myArray0: Array<Option<Int32>> = [a, b, Some<Int32>(0)]
    return 0
}
