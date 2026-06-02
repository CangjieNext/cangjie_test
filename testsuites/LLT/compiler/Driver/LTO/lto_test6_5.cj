// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

internal import std.collection.*

main() {
    var m: HashMap<String, Int64> = HashMap<String, Int64>()
    var arr: Array<(String, Int64)> = [("d", 11), ("e", 12)]
    m.add(all: arr)
    var d = m.get("d")
    m.remove("d")
    var bool = m.contains("d")
    if (d == 11 && bool == false) {
        return 0
    } else {
        return 1
    }
}
