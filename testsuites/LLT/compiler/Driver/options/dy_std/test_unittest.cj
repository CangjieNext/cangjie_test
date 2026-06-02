// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %f -o %output --dy-std --dy-libs %cmp_utest_opt
//  EXEC-0: %run %run_opt %output %run_utest_opt %run_args
//  EXEC-PIPE: %ldd %output | compare %f
// (Linux and CJNATIVE) ASSERT: scan cangjie-std-unittest.so
// (Linux and CJNATIVE) ASSERT: scan-not cangjie-std-unittest.testmacro.so
// (Darwin and CJNATIVE) ASSERT: scan cangjie-std-unittest.dylib
// (Darwin and CJNATIVE) ASSERT: scan-not cangjie-std-unittest.testmacro.dylib
// (Windows and CJNATIVE) ASSERT: scan cangjie-std-unittest.dll
// (Windows and CJNATIVE) ASSERT: scan-not cangjie-std-unittest.testmacro.dll

import std.unittest.*

func add(a: Int64, b: Int64) {
    return a + b
}

@Test
public class TestAdd {
    @TestCase
    func test(): Unit {
        @Assert(add(1, 2), 3)
        ()
    }
}

main() {
    TestAdd().asTestSuite().runTests()
    return 3
}

// NOTE: This test case costs 50+ seconds in debug mode.
