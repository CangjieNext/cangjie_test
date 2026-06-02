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

enum E<T> {
    En(Array<Int64>)
    | Cn(Array<T>)
}

func test<T>(input: T) {
    var b = E<T>.Cn([input])
    var res = match (b) {
        case Cn(x) => x.size - 1
        case _ => 1
    }
    return res
}

main(): Int64 {
    return test(1)
}
