// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2<&1| compare %f
// ASSERT: scan  at default::A::<(default::A)

class A {
    operator func <(a: A) {
        throw Exception()
        return 0
    }
}

main() {
    var x = A()
    var d = A()
    d < x

    0
}
