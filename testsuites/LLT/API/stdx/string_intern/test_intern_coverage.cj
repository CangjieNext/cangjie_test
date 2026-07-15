/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output %cmp_utest_opt
// (Unix) EXEC-PIPE: %set_stdx_path %run %run_opt %output %run_utest_opt %run_args
import std.unittest.*
import stdx.string_intern.*

@Test
public class StringInternCoverageTest {
    @TestCase
    func testInternBasic(): Unit {
        let s1 = String.intern("hello")
        let s2 = String.intern("hello")
        @Expect(s1 == s2, true)
    }
    @TestCase
    func testInternEmpty(): Unit {
        let s = String.intern("")
        @Expect(s == "", true)
    }
    @TestCase
    func testInternByteArray(): Unit {
        let bytes = unsafe { "world".rawData() }
        let s = String.intern(bytes)
        @Expect(s == "world", true)
    }
    @TestCase
    func testInternLongString(): Unit {
        let long = "a" * 600
        let s = String.intern(long)
        @Expect(s == long, true)
    }
    @TestCase
    func testConfigPool(): Unit {
        String.configInternPool(capacity: 10, strMaxLength: 100)
        let s1 = String.intern("test1")
        let s2 = String.intern("test2")
        @Expect(s1 == "test1", true)
        @Expect(s2 == "test2", true)
    }
    @TestCase
    func testInternEviction(): Unit {
        String.configInternPool(capacity: 3, strMaxLength: 50)
        for (i in 0..10) {
            String.intern("str${i}")
        }
        let s = String.intern("str0")
        @Expect(s == "str0", true)
    }
    @TestCase
    func testInternSameRef(): Unit {
        String.configInternPool(capacity: 100, strMaxLength: 256)
        let s1 = String.intern("duplicate")
        let s2 = String.intern("duplicate")
        @Expect(s1 == s2, true)
    }
    @TestCase
    func testInternByteArrayEmpty(): Unit {
        let empty: Array<Byte> = []
        let s = String.intern(empty)
        @Expect(s == "", true)
    }
}
