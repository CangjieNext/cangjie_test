// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %n.cj -o %output
// EXEC-PIPE-0: %run %run_opt %output

class protected {}

enum open {
    public
    | private
}

enum a {
    | public(Float32)
    | private(Float32, Float32)
    | protected(Float32, Float32, Float32)
    | redef(Float32, Float32, Float32, Float32)
}

let case1 = open.private
let c2 = Option<protected>.None

main() {
    let x = public
    match (x) {
        case open.public => 0
        case private => 1
    }
}
