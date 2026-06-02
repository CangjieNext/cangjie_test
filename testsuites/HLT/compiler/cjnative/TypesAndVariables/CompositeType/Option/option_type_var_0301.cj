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

class Data {
    public var a: Int32
    public init(x: Int32) {
        a = x
    }
}

func foo1(): Option<Data> {
    return Option<Data>.Some(Data(1))
}

func foo2(): Option<Data> {
    return Option<Data>.None
}

func run(): Int64 {
    var res1: Data = match (foo1()) {
        case Some(x) => x
        case None => Data(0)
    }

    var res2: Data = match (foo2()) {
        case Some(x) => x
        case None => Data(0)
    }

    if (res1.a == 1 && res2.a == 0) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
