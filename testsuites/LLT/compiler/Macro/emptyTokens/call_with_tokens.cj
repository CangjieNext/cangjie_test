// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

class Tokens {
    public init() {}
}

main() {
    var a = quote() + quote(1)
    if (a.size != 1) {
        return 1
    }
    return 0
}
