// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct SA<T> {
    var a = 1
}

func getEnum<T>(): Option<SA<T>> {
    Some(SA<T>())
}

main() {
    let ea = getEnum<Int64>()
    if (let Some(v) <- ea) {
        return 0
    }
    1
}
