macro package define

import std.ast.*

enum E{|e}

public macro e(x:Tokens){x}

main(): Int64 {
    var a = e
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
