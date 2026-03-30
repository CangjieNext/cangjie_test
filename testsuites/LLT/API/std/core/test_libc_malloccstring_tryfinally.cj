/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt 

@Test
class LibCMallocCStringTryFinallyTest {
    @TestCase
    func testMallocCStringBasic(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("Hello")
            @Expect(cstr.size(), 5)
            LibC.free(cstr)
        }
    }

    @TestCase
    func testMallocCStringEmpty(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("")
            @Expect(cstr.size(), 0)
            LibC.free(cstr)
        }
    }

    @TestCase
    func testMallocCStringLongString(): Unit {
        unsafe {
            let longStr = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
            let cstr = LibC.mallocCString(longStr)
            @Expect(cstr.size(), 100)
            LibC.free(cstr)
        }
    }

    @TestCase
    func testMallocCStringWithNullChar(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("Test\0String")
            @Expect(cstr.size(), 4)
            LibC.free(cstr)
        }
    }

    @TestCase
    func testMallocCStringMultipleAllocations(): Unit {
        unsafe {
            let cstr1 = LibC.mallocCString("First")
            let cstr2 = LibC.mallocCString("Second")
            let cstr3 = LibC.mallocCString("Third")
            
            @Expect(cstr1.size(), 5)
            @Expect(cstr2.size(), 6)
            @Expect(cstr3.size(), 5)
            
            LibC.free(cstr1)
            LibC.free(cstr2)
            LibC.free(cstr3)
        }
    }

    @TestCase
    func testMallocCStringWithSpecialChars(): Unit {
        unsafe {
            let cstr = LibC.mallocCString("Hello\nWorld\t!")
            @Expect(cstr.size(), 13)
            LibC.free(cstr)
        }
    }

    @TestCase
    func testMallocCStringVeryLongString(): Unit {
        unsafe {
            var longStr = ""
            for (i in 0..1000) {
                longStr = longStr + "A"
            }
            let cstr = LibC.mallocCString(longStr)
            @Expect(cstr.size(), 1000)
            LibC.free(cstr)
        }
    }

    @TestCase
    func testMallocCStringRepeatedAllocFree(): Unit {
        unsafe {
            for (i in 0..100) {
                let cstr = LibC.mallocCString("Test")
                @Expect(cstr.size(), 4)
                LibC.free(cstr)
            }
        }
    }
}
