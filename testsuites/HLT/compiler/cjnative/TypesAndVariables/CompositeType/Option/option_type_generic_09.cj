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

struct Data<T> {
    public var opt: T
    public init(opt1: T) {
        opt = opt1
    }
}

func run(): Int64 {
    let opt1 = Option<Int32>.Some(2)
    var data: Data<Option<Int32>> = Data<Option<Int32>>(opt1)
    var opt2: Option<Int32> = data.opt
    var res: Int32 = match (opt2) {
        case Some(x) => x + 1
        case None => 0
    }
    if (res == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
