// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f --disable-reflection -o %output
// RUN-EXEC: %run %run_opt %output

enum E {
    R | G | B

    static func foo() {
        return 3
    }

    func bar() {
        let a = foo
        var b = foo
    }
}

main() {
    var a = R
}
