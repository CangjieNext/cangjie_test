// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %n.cj -o %output 2>&1

main() {
    unsafe {
        let f: (Int64, CFunc<(Int64) -> Int64>) -> Int64 = { x, y => y(x + 1) }
        return f(1, { x => x + 1 }) - 3
    }
}