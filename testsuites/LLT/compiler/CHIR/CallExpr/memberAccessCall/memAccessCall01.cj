// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class Data<T> {
    public let f: (T) -> T = {height: T => height}
    public init() {}
}

/* Sub-Case B-1: function value call */
main(): Int64 {
    let data: Data<Int64> = Data<Int64>()
    var res = data.f(4)
    return 0
}
