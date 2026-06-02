// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

var a = 0

func foo() {
    a++
    return 1
}

var _ = (1, (2, 3))

let _ = (foo(), ((1, foo() + 1), 1.5))

main() {
    return a - 2
}
