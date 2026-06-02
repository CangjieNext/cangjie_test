/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

//LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output --test
// RUN-EXEC-PIPE-0: %run %run_opt %output --no-progress %run_args --no-color 2>&1 | compare %f

// Check no progress bar
// ASSERT: regex-not \[(\|*)(\-*)\]

// Check no percent
// ASSERT: regex-not (\d)+ \%

// Check no groups status
// ASSERT: scan-not 📦 group

// Check no test cases status
// ASSERT: scan-not 🧪 test

import std.sync.*
import std.time.*

@Test[a in [ 0, 10, 1000 ]]
func paramTest(a: Int64) {
    @Expect(a != 1001)
}

@Test
class test_01 {
    let fmt = DateTimeFormat.of(DateTimeFormat.RFC822)

    @TestCase
    func test_format() {
        println(DateTimeFormat.RFC822)
        @Expect(fmt.format, "ww dd MMM yy HH:mm:ss z")
    }
}
