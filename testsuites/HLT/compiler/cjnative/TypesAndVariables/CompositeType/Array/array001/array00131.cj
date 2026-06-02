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
    var a = 0..10 : 1
    let myArray = [a, 0..10 : 2]
    let youArray = [a, 0..10]
    /*
    var a : Range = 0..10:1
    let myArray : Array<Range> = [a,0..10:2]
    let youArray : Array<Range> = [a,0..]
     */
    return 0
}
