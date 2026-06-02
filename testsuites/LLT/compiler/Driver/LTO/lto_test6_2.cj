// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args 2>&1

internal import std.sync.*
internal import std.time.*

var a = AtomicInt64(0)

main() {
    for (_ in 0..2) {
        spawn {
            for (_ in 0..1000) {
                a.fetchAdd(1)
            }
        }
    }
    sleep(Duration.second)
    if (a.load() == 2000) {
        return 0
    } else {
        return 1
    }
}
