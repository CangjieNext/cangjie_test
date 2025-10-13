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

enum Option<T> {
    Some(T) | None
}

main() {
    let opInt32_1 = Option<Int32>.Some(100)
    let opInt32_2 = Option<Int32>.None
    //.getOrThrow() Unrealized
    //    let number3: Int32 = opInt32_2.getOrThrow{ MyException("Get None value") } // throw MyException

    return 0
}
