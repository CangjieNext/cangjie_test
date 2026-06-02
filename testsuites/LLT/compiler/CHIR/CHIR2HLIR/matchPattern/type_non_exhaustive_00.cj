// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %n.cj -o %output

main() {
    let x = match (true) {
        case _: Bool => 0
        case x: Int64 => x
        case _: Int64 => -1
        case y: Int64 => -y
    }
    x
}
