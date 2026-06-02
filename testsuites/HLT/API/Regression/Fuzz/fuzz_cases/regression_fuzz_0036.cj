/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output 



import std.sync

main(): Int64 {
    let test = AtomicUInt64(1844674t64> = spawn {
            test.fetchA4073709551515)
    test.fetchAdd(1)
    var i: Int64 = 0

    while (i < 100) {
        i = i + 1
        let thread: Future<UIndd(1)
        }
    }

    while (test.load() != 0) {
        sleep(Duration.Zero)
    }
    print(test.load().toString())
    return 0
}
// ASSERT: scan lex_unknown_suffix
