/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 

@Test
class CStringTest {
    @TestCase
    func baseAttributes(): Unit {
        unsafe {
            var string: CString = LibC.mallocCString("Hello World")
            @Expect(string.isNull(), false)
            @Expect(string.size(), 11)
            @Expect(string.isEmpty(), false)
            @Expect(string.isNotEmpty(), true)
            LibC.free(string)
        }
    }

    @TestCase
    func cstringStartWith(): Unit {
        var string = CString(CPointer<UInt8>())
        var prefix = CString(CPointer<UInt8>())

        unsafe {
            prefix = LibC.mallocCString("cangjie")
            @Expect(string.startsWith(prefix), false)
            LibC.free(prefix)
            prefix = CString(CPointer<UInt8>())
        }

        unsafe {
            string = LibC.mallocCString("cangjie")
            @Expect(string.startsWith(prefix), false)
            LibC.free(string)
        }

        unsafe {
            string = LibC.mallocCString("cangjie")
            prefix = LibC.mallocCString("cangjie仓颉")
            @Expect(string.startsWith(prefix), false)
            LibC.free(prefix)
            LibC.free(string)
        }

        unsafe {
            string = LibC.mallocCString("cangjie")
            prefix = LibC.mallocCString("cang")
            @Expect(string.startsWith(prefix), true)
            LibC.free(prefix)
            LibC.free(string)
        }

        unsafe {
            string = LibC.mallocCString("cangjie")
            prefix = LibC.mallocCString("Cang")
            @Expect(string.startsWith(prefix), false)
            LibC.free(prefix)
            LibC.free(string)
        }
    }

    @TestCase
    func cstringEndsWith(): Unit {
        var string = CString(CPointer<UInt8>())
        var suffix = CString(CPointer<UInt8>())

        unsafe {
            suffix = LibC.mallocCString("cangjie")
            @Expect(string.endsWith(suffix), false)
            LibC.free(suffix)
            suffix = CString(CPointer<UInt8>())
        }

        unsafe {
            string = LibC.mallocCString("cangjie")
            @Expect(string.endsWith(suffix), false)
            LibC.free(string)
        }

        unsafe {
            string = LibC.mallocCString("cangjie")
            suffix = LibC.mallocCString("cangjie仓颉")
            @Expect(string.endsWith(suffix), false)
            LibC.free(suffix)
            LibC.free(string)
        }

        unsafe {
            string = LibC.mallocCString("cangjie")
            suffix = LibC.mallocCString("jie")
            @Expect(string.endsWith(suffix), true)
            LibC.free(suffix)
            LibC.free(string)
        }

        unsafe {
            string = LibC.mallocCString("cangjie")
            suffix = LibC.mallocCString("Jie")
            @Expect(string.endsWith(suffix), false)
            LibC.free(suffix)
            LibC.free(string)
        }
    }

    @TestCase
    func cstringCompare(): Unit {
        unsafe {
            var string: CString = LibC.mallocCString("Hello World")
            var rhs = CString(CPointer<UInt8>())
            @Expect(string.equals(rhs), false)
            @Expect(string.equalsLower(rhs), false)
            try {
                string.compare(rhs)
                @Expect(false)
            } catch (e: Exception) {
                @Expect(e.message, "The two CString values to be compared cannot be null.")
            }

            rhs = LibC.mallocCString("Hello World")
            @Expect(string.equals(rhs), true)
            @Expect(string.equalsLower(rhs), true)
            @Expect(string.compare(rhs), 0)

            LibC.free(string)
            LibC.free(rhs)
            string = LibC.mallocCString("Hello World")
            rhs = LibC.mallocCString("hello world")
            @Expect(string.equals(rhs), false)
            @Expect(string.equalsLower(rhs), true)
            @Expect(string.compare(rhs), -1)

            LibC.free(string)
            LibC.free(rhs)
            string = CString(CPointer<UInt8>())
            rhs = LibC.mallocCString("Hello World")
            @Expect(string.equals(rhs), false)
            @Expect(string.equalsLower(rhs), false)
            try {
                string.compare(rhs)
                @Expect(false)
            } catch (e: Exception) {
                @Expect(e.message, "The two CString values to be compared cannot be null.")
            }

            LibC.free(rhs)
            string = LibC.mallocCString("cangjie")
            rhs = LibC.mallocCString("CangJie")
            @Expect(string.compare(rhs), 1)

            LibC.free(string)
            LibC.free(rhs)
        }
    }

    @TestCase
    func cstringNullEquals(): Unit {
        var nullStr1 = CString(CPointer<UInt8>())
        var nullStr2 = CString(CPointer<UInt8>())

        @Expect(nullStr1.equals(nullStr1), true)
        @Expect(nullStr2.equals(nullStr2), true)
        @Expect(nullStr1.equals(nullStr2), true)
        @Expect(nullStr2.equals(nullStr1), true)

        @Expect(nullStr1.equalsLower(nullStr1), true)
        @Expect(nullStr2.equalsLower(nullStr2), true)
        @Expect(nullStr1.equalsLower(nullStr2), true)
        @Expect(nullStr2.equalsLower(nullStr1), true)

        unsafe {
            var nonNullStr = LibC.mallocCString("test")
            @Expect(nullStr1.equals(nonNullStr), false)
            @Expect(nonNullStr.equals(nullStr1), false)
            @Expect(nullStr1.equalsLower(nonNullStr), false)
            @Expect(nonNullStr.equalsLower(nullStr1), false)
            LibC.free(nonNullStr)
        }
    }

    @TestCase
    func cstringSlice(): Unit {
        unsafe {
            var string: CString = LibC.mallocCString("cangjie仓颉")

            var subString = string.subCString(UIntNative(string.size()))
            @Expect(subString.isNull())

            subString = string.subCString(0)
            @Expect(subString.toString(), "cangjie仓颉")
            LibC.free(subString)

            subString = string.subCString(3)
            @Expect(subString.toString(), "gjie仓颉")
            LibC.free(subString)

            try {
                string.subCString(UIntNative(string.size() + 1))
                @Expect(false)
            } catch (e: IndexOutOfBoundsException) {
            }
            LibC.free(string)
        }
    }

    @TestCase
    func cstringSliceWithSubLen(): Unit {
        unsafe {
            var string: CString = LibC.mallocCString("cangjie仓颉")
            @Expect(string.size(), 13)

            var subString = string.subCString(UIntNative(string.size()), 3)
            @Expect(subString.isNull())

            subString = string.subCString(UIntNative(string.size() - 1), 0)
            @Expect(subString.isNull())

            subString = string.subCString(0, UIntNative(string.size()))
            @Expect(subString.toString(), "cangjie仓颉")
            LibC.free(subString)

            subString = string.subCString(6, UIntNative(string.size() + 3))
            @Expect(subString.toString(), "e仓颉")
            LibC.free(subString)

            subString = string.subCString(7, 1)
            try {
                subString.toString()
                @Expect(false)
            } catch (_: Exception) {
                @Expect(true)
            }
            LibC.free(subString)

            subString = string.subCString(7, 3)
            @Expect(subString.toString(), "仓")
            LibC.free(subString)

            try {
                string.subCString(UIntNative(string.size() + 1), 2)
                @Expect(false)
            } catch (e: IndexOutOfBoundsException) {
            }
            LibC.free(string)
        }
    }
}
