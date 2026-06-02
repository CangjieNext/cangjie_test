// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix %run_args

internal import std.time.*
internal import std.sync.*
internal import std.runtime.*

main(args: Array<String>): Int64 {
    var t = Timer.once(Duration.second) {=>}

    t = Timer.once(Duration.second) {=>}

    if (args.contains("--asan")) {
        sleep(Duration.second)
        GC()
        sleep(Duration.second)
    }
    return 0
}
