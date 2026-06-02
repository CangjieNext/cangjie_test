// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-8: %run %run_opt %output %run_args

open class CB<T> {
    var abc: T
    init(y: T) {
        abc = y
    }
}

class CA <: CB<Int64> {
    init(y: Int64) {
        super(y)
    }
}

struct SA<T> where T <: CB<Int64> {
    var x: T
    init(y: T) {
        x = y
    }
    func fff() {
        x.abc
    }
}

main() {
    SA<CA>(CA(8)).fff()
}
