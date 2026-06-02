// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

import macro_def_pkg.*
internal import std.ast.*

var flag = false

main() {
    @main_macro_define(quote(1)) // will not change flag value.
    println(flag)
    if (flag) {
        return 1
    } else {
        return 0
    }
}
