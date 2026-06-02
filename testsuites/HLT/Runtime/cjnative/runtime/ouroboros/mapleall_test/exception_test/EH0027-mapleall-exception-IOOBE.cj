/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// (Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 1>log.txt && bash -c "dos2unix log.txt" && bash -c "cat log.txt" | compare %f
/* SCAN-IN
7
5
307
 */

class IOOBE {
    public static func TestArrayAccess(n: Int64): Int64 {
        var r: Int64 = 0
        var iarr: Array<Int32> = [0, 0, 0, 0, 0]
        try {
            r = 3
            iarr[n] = Int32(r)
            r += 4
        } catch (e: IndexOutOfBoundsException) {
            r += 100
        }
        return r
    }

    public static func TestStringAccess(n: Int64): Int64 {
        var r: Int64 = 0
        try {
            r = 1
            var hello: String = "hello"
            var sub: String = hello[2..2 + n % 10]
            r += 4
        } catch (e: IndexOutOfBoundsException) {
            r += 200
        }
        return r
    }

    public static func TestVectorAccess(n: Int64): Int64 {
        var r: Int64 = 0
        var vi: Array<Int32> = [0, 0, 0, 0, 0]
        try {
            r = 7
            vi[n % 10] = 35
            r += 8
        } catch (e: IndexOutOfBoundsException) {
            r += 300
        }
        return r
    }

    public static func TestMain(c: Int64): Int64 {
        // Thrown to indicate that an index of some sort
        // (such as to an array, to a string, or to a vector) is out of range.
        if (c <= 10) {
            return TestArrayAccess(c)
        } else if (c <= 20) {
            return TestStringAccess(c)
        } else {
            return TestVectorAccess(c)
        }
    }
}

main(): Int64 {
    print(IOOBE.TestMain(3).toString() + "\n")
    print(IOOBE.TestMain(13).toString() + "\n")
    print(IOOBE.TestMain(36).toString() + "\n")
    return 0
}
