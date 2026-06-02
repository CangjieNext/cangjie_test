/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

enum B<T> {
    a(Bool)
}

enum A<T> {
    a(T)
}

main(): Int64 {
    var i = a<Int64>(1) // A<Int64>.a<Int64>(1)
    var j = a<Int64>(true) // B<Int64>.a<Int64>(true)
    return 0
}
