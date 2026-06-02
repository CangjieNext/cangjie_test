// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import std.collection.*

func decode(): String {
    var aa = Array<UInt8>(9, repeat: 1)
    return String.fromUtf8(aa)
}

main() {
    let a = decode()
    return 0
}
