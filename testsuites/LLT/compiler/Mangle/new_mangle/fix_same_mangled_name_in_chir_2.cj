// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-0: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-0: %run %run_opt %output %run_args

func test(lam: (Int64) -> (Int32, Int8)): Int64 {
    return 0
}

func test(lam: (Int64, Int32) -> (Int8)): Int64 {
    return 0
}

func new_test1() {
    func foo(a: Int64): (Int64) -> Int64 {
        return {x: Int64 => x}
    }
    return foo
}

func new_test2() {
    func foo(a: Int64, b: Int64): Int64 {
        return 0
    }
    return foo
}

main() {
    return 0
}
