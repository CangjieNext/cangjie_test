// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %f -o %output
// EXEC: %run %run_opt %output %run_args

@C
struct Data {}

@C
func foo(): Data {
    return Data()
}

unsafe main() {
    foo()
    var f = foo
    f()
    0
}
