// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

struct Data<T> {
    public let a: T
    public init(v: T) {
        a = v
    }
}

func run(): Int64 {
    let d: Data<Int32> = Data<Int32>(2)
    if (d.a == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
