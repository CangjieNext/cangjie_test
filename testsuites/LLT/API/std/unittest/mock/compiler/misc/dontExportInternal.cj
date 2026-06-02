/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %mkdir src
// EXEC-0: %compiler %cmp_opt --no-sub-pkg --mock=on -Woff=all %n.cj -o %output %cmp_utest_opt 2>&1

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

class C {}

let c: C = C()

interface I {}

@Test
func test_not_export_mocked() {
    let i = mock<I>()
}

public class DontExportPrivateMembers {
    private mut prop p: PrivateClass {
        get() {
            throw Exception("")
        }
        set(pc) {
            throw Exception("")
        }
    }
    private func foo(p: PrivateClass): Unit {}
}

private class PrivateClass {}

// ASSERT: scan-not error
