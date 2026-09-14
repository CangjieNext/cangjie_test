// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Float power and user operators are Apply boundaries for value propagation.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-not "DiagKind":

struct Counter {
    let value: Int64

    init(value: Int64) {
        this.value = value
    }

    operator func +(other: Counter): Counter {
        Counter(this.value + other.value)
    }
}

main() {
    const power: Float64 = 2.0 ** 3.0
    if (power < 0.0) {
        println("not diagnosed through Float power")
    }

    let result = Counter(1) + Counter(2)
    if (result.value != 3) {
        println("not diagnosed through a user operator")
    }
}
