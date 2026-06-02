// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj -o %output 2>&1
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan result: 6

main () {
    const (x, y, z) = (1, 2, 3)
    print("result: ")
    println(x + y + z)
    0
}