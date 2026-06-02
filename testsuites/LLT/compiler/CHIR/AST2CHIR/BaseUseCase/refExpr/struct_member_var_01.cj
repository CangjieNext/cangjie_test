// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler --disable-reflection %noStackInfo %f -o %output
// RUN-EXEC: %run %run_opt %output

struct S {
    var a = 1
    let b = 2
    func pA() {
        b
    }
    mut func pB() {
        b;
        a = 11
    }
}

main() {
    0
}
