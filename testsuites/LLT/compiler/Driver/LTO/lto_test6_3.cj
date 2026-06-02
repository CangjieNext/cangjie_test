// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args 2>&1

internal import std.overflow.*

main() {
    var a: UInt8 = 100
    var b = a.saturatingAdd(UInt8(160))
    var c = a.wrappingAdd(UInt8(160))
    if (b == 255 && c == 4) {
        return 0
    } else {
        return 1
    }
}
