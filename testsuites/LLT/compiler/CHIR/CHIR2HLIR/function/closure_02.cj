// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %n.cj %diag_json -o %output

func h() {
    var x = 1

    func g() {
        x
    } // captured a mutable variable

    func f() {
        g() // invoked g
    }
    return f // error
}

main() {
    h()()
}
// ASSERT: scan sema_func_capture_var_cannot_return
