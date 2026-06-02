// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt -Woff unused %n.cj

struct SA {
    var x = 1
}

main() {
    match ([Option<(Int64, Option<SA>)>.None][0]) {
        case v: Int8 => 1
        case None => 2
        case _ => 3
    }
}
