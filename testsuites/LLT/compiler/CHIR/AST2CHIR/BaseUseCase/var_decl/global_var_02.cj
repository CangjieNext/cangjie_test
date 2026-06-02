// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-1: %run %run_opt %output

func foo() {
    return true
}

func goo() {
    return 2
}

var a = if (foo()) {
    1
} else {
    goo()
}
let b = if (!foo()) {
    1
} else {
    goo()
}

main() {
    return b - a
}
