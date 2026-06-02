/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt -o %n.%suffix %f %cmp_utest_opt
// (CJNATIVE) EXEC: %run %run_opt %n.%suffix %run_utest_opt %run_args

import std.collection.*
import std.sync.SyncCounter

@Test
class CollectionConcurrentTest {
    @TestCase
    func testArrayStackConcurrent() {
        let itemNum = 100
        let threadNum = 200
        let _ = VArray<Int64, $10000>(repeat: 2)
        let st = ArrayStack<VArray<Int64, $10000>>(itemNum)
        for (_ in 0..itemNum) {
            st.add(VArray<Int64, $10000>(repeat: 1))
        }
        let sc = SyncCounter(threadNum)
        for (_ in 0..threadNum) {
            spawn {
                try {
                    if (let Some(varr) <- st.remove()) {
                        var pass = true
                        for (i in 0..10000) {
                            let x = varr[i]
                            if (x != 1 && x != 0) {
                                pass = false
                                break
                            }
                        }
                        @Expect(pass)
                    }
                } catch (e: IndexOutOfBoundsException) {
                } finally {
                    sc.dec()
                }
            }
        }
        sc.waitUntilZero()
    }
}
