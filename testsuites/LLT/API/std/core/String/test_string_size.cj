/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.runtime.*

@Test
class StringTest {
    @TestCase
    func testStringMemory() {
        const n = 100000
        let heapSize1 = getAllocatedHeapSize()
        let _ = Array<String>(n, repeat: String.empty)
        let heapSize2 = getAllocatedHeapSize()
        let sizeOfString = (heapSize2 - heapSize1) / n
        @Expect(sizeOfString, 16)
    }
}
