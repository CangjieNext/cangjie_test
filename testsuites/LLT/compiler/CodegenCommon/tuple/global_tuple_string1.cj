// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-0: %run %run_opt %output %run_args

var dd = "444"
var xxx = if (true) {
    (1, "444")
} else {
    (1, "2")
}

main(): Int64 {
    var (a_, b_) = xxx
    println("after:${a_},${b_}")
    if (a_ != 1 || b_ != "444") {
        return 1
    }
    return 0
}
