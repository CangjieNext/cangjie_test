// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f
// EXEC: %run %run_opt %n.%suffix
func chr(): Int64 {
    1
}

func len(): Int32 {
    1
}

func print(): Int32 {
    1
}

func ord(): Unit {}

func sleep(): Int64 {
    1
}

main(): Int64 {
    chr()
    len()
    print()
    ord()
    sleep()
    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
