// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

internal import std.regex.*

main() {
    let r = Regex("\\d+")
    let m = r.matcher("13588123456afad")
    let matchData1 = m.matchStart()
    match (matchData1) {
        case Some(md) =>
            if (md.matchString() == "13588123456") {
                return 0
            } else {
                return 1
            }
        case None => return 1
    }
}
