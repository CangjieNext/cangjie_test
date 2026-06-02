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

func foo1<T>(x: T): Option<T> {
    return Option<T>.Some(x)
}

func foo2<T>(): Option<T> {
    return Option<T>.None
}

func run(): Int64 {
    var res1: String = match (foo1<String>("Option")) {
        case Some(x) => x
        case None => ""
    }
    var res2: Int32 = match (foo2<Int32>()) {
        case Some(x) => x
        case None => 0
    }

    if (res1 == "Option" && res2 == 0) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
