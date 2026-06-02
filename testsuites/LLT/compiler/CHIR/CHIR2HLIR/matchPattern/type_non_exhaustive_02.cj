// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output

main() {
    let x = match (true) {
        case _: (Bool, Int64) => 0
        case _: Option<Bool> => 1
        case _: Bool => 2
    }
    x
}
