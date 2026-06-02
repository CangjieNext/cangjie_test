// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f
// ASSERT: scan a=1
// ASSERT: scan b=2
// ASSERT: scan c=3
// ASSERT: scan d=4

let point1: (Int64, Int64) = (1, 2)

let (a, b) = point1

let point2: (Int64, Int64) = (3, 4)

let (c, d) = point2

main(): Int64 {
    print("a=${a}\n")
    print("b=${b}\n")
    print("c=${c}\n")
    print("d=${d}\n")
    return 0
}
