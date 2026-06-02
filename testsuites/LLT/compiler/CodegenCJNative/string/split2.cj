// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func run(): Int64 {
    var s1: String = "A_bc"
    var cs1 = s1.split("_")
    print(cs1[0])
    print("${cs1.size}")
    return 0
}

main(): Int64 {
    return run()
}

// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
