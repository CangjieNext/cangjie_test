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

interface I<T> {
    func getOption(): T
}

class Foo <: I<Option<Int32>> {
    public func getOption(): Option<Int32> {
        Option<Int32>.Some(4)
    }
}

func run(): Int64 {
    var opt: Option<Int32> = Foo().getOption()
    var res: Int32 = match (opt) {
        case Some(x) => x + 1
        case None => 0
    }
    if (res == 5) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
