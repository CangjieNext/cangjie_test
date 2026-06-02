// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output

func foo() {
    return 1
}

var (a, b) = (1, (2, 3))

let (c, (d, _)) = (foo(), ((1, foo() + 1), 1.5))

main() {
    return a + b[0] - c - d[1]
}
