// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

main(): Int64 {
    var a = 0
    var b = 0
    var c = 0
    a = 1 << 2 + 3
    c = a & 0xFF + b
    if (a & b == 0) {
        return 0
    } else {
        return 1
    }
}