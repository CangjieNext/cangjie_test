// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    var res = func29(namedParam31: if (true) {
        (Option<Rune>.None ?? r'J')
    } else {
        r'd'
    });

    return res;
}

func func29(namedParam31!: Rune, optionalParam32!: Int64 = 5) {
    if (namedParam31 == r'J') {
        return optionalParam32 - 5
    } else {
        1
    }
}
