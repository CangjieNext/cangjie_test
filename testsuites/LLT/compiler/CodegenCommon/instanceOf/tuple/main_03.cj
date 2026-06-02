// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

interface Numeral {
    func info(): Unit
}

extend Int64 <: Numeral {
    public func info() {
        println("Int64: ${this}")
    }
}

extend Float64 <: Numeral {
    public func info() {
        println("Float64: ${this}")
    }
}

main() {
    let x: Any = (1, 2)
    if (x is (Numeral, Numeral)) {
        let y = (x as (Numeral, Numeral)).getOrThrow()
        y[0].info()
        return 2
    } else {
        return 0
    }
}
