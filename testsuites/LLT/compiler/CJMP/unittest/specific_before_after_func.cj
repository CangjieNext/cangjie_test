// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/common_test.cj
// EXEC-0: %compiler %noColor --experimental --test c/common_test.cj --output-type=chir --output-dir ./c
package pkg

import std.unittest.*
import std.unittest.testmacro.*

@Test
common class LifecycleTest {
    var called: Bool = false
    init() {}
    
    @BeforeEach
    common func setup() {
        throw Exception("Common setup!")
        @Expect(false, true)
    }
    
    @AfterEach
    common func teardown() {
        throw Exception("Common teardown!")
        @Expect(false, true)
    }

    @TestCase
    func boo() {
        called = true
        @Expect(true, true)
    }

    @TestCase
    common func foo() {
        @Expect(false, true)
    }
}

// SEPARATE-FILE: p/spec_test.cj
// EXEC-0: %compiler %noColor --experimental --test p/spec_test.cj --common-part-chir=c/pkg.chir --common-part-cjo=./c/pkg.cjo -L. -o %output
// EXEC: %run %output
package pkg

import std.unittest.*
import std.unittest.testmacro.*

@Test
specific class LifecycleTest {
    @BeforeEach
    specific func setup() { }
    
    @AfterEach
    specific func teardown() { }
    
    @TestCase
    specific func foo() {
        @Expect(this.called, true)
        @Expect(true, true)
    }
}
