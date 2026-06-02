// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// RUN-EXEC: %run %run_opt %output

class CA<T> {
    operator func [](x: T): Int64 {
        a += 1
        return a
    }
    var a: Int64 = 0
}

main() {
    let foo = CA<Unit>()
    let res = foo[()] + 1
}
