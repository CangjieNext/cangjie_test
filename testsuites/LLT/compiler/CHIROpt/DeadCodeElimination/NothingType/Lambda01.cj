// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

var a = Some(1)
var b = Some(2)
var c = Some(3)
let test = {
    =>
    while (return a.getOrThrow()) {
        return b.getOrThrow()
    }
    return c.getOrThrow()
}

main(): Int64 {
    test()
    0
}
