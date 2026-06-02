// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

internal import std.convert.*

main(): Int64 {
    var a: Int32 = -20
    var res = a.format("+10")
    if (res == "       -20") {
        return 0
    }
    return 1
}
