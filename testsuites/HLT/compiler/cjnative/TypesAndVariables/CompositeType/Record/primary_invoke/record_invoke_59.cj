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
    func a(): Int32 {
        2
    }
}

class B<T> <: I<T> {}

struct Data<T> {
    public let recIf: T
    public Data(x: T) {
        recIf = x
    }
}

func run(): Int64 {
    let data: Data<I<Int32>> = Data<I<Int32>>(B<Int32>())
    var recIf: I<Int32> = data.recIf
    var res: Int32 = recIf.a()
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
