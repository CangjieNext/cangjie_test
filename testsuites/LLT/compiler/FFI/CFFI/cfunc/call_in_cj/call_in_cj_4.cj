// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %f -L . -l %n -o %output
// EXEC: %run %run_opt %output %run_args

foreign func runCallback(cb: CFunc<(Int32, Int32) -> Int32>, a: Int32, b: Int32): Int32

@C
func foo(a: Int32, b: Int32): Int32 {
    return if (a > b) {
        a - b
    } else {
        b - a
    }
}

unsafe main() {
    var res = runCallback(foo, 1, 2)
    if (res != 1) {
        return 1
    }
    var f = foo
    res = runCallback(f, 3, 4)
    if (res != 1) {
        return 1
    }
    return 0
}
