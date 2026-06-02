// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 111222
// ASSERT: scan-not 333444

func f1() {
    print("111")
    0
}

func f2() {
    print("222")
    0
}

func f3() {
    print("333")
    0
}

func f4() {
    print("444")
    0
}

func foo(a: Int64, b: Int64, c: Int64, d: Int64, e: Int64) {
    1
}

main(): Int64 {
    let x = foo(f1(), f2(), (return 0), f3(), f4())
    return 1
}
