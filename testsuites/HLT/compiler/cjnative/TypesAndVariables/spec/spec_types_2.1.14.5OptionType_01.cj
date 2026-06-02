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

main() {
    let v1: ?Int64 = 100
    let v2: ??Int64 = 100
    let opInt32_1 = Option<Int32>.Some(100) // The type of 'opInt32_1' is 'Option<Int32>' 
    let opInt32_2 = Option<Int32>.None // The type of 'opInt32_2' is 'Option<Int32>'
    let opChar = Option<Rune>.Some(r'm') // The type of 'opChar' is 'Option<Rune>'
    let opBool = Option<Bool>.None // The type of 'opBool' is 'Option<Bool>'
    let opEnum = Option<TimeUnit1>.Some(TimeUnit1.Year) // The type of 'opEnum' is 'Option<TimeUnit1>'
    return 0
}

enum TimeUnit1 {
    Year | Month | Day | Hour
}
