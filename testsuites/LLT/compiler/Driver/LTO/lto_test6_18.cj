// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

internal import std.argopt.*

main() {
    var a: Array<String> = ["-a123", "-bofo", "-cfoo", "-d789", "bar", "--condition=foo", "--testing=456"]
    let lof: Array<String> = ["condition=", "testing"]
    let str: String = "ab:c:d:k:u:x"
    let ao: ArgOpt = ArgOpt(a, str, lof)
    a = ao.getUnparseArgs()
    let p: Option<String> = ao.getArg("-b")
    match (p) {
        case Some(v) =>
            if (v == "ofo") {
                return 0
            } else {
                return 1
            }
        case _ => return 1
    }
}
