// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %n.cj -o %output
// EXEC: %run %output

extend Int64 {
    static func test() {
        7
    }
}

main() {
    var x = Int64.test
    return x() - 7
}
