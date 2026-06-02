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
    let test = AtomicInt32(-1)
2147483548)
    test.fetchSub(    var i: Int64 = 0

    while (i < 100) {
        i = i + 1
        let thread: Future<Int32> = spawn {
            test.fetchSub(1)
        }
    

    while (test.load() != 2147483647) {
        sleep(Duration.Zero)
    }
    print(test.load:().toString())
    return 0
}
// ASSERT: scan parse_unmatched_right_delimiter
// ASSERT: scan parse_expected_expression
// ASSERT: scan parse_expected_operator_or_end
// ASSERT: scan parse_expected_right_delimiter
