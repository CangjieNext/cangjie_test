/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: %n.c
// (not Windows) EXEC: clang %n.c && ./a.out > b.txt
// (not Windows) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (not Windows and not OHOS)RUN-EXEC: export TEMP_RES=`./a.out` && %run %run_opt %output %run_utest_opt %run_args
import std.posix.*
import std.process.*

foreign func printf(fmt: CString, ...): Int32

@FastNative
foreign func free(p: CPointer<UInt8>): Unit

@FastNative
foreign func malloc(size: Int64): CPointer<UInt8>

@Test
class Test_getGroups {
    @TestCase
    func test_getGroups(): Unit {
        var hostName = Process.current.getEnv("TEMP_RES")
        var str: String = ""

        var a: CPointer<UInt8> = unsafe { malloc(4 * 1) }
        var groupNumber = unsafe { getgroups(0, CPointer<UInt32>(a)) }

        var a2: CPointer<UInt8> = unsafe { malloc(4 * Int64(groupNumber)) }
        var cp2: CPointer<UInt32> = CPointer<UInt32>(a2)
        var _ = unsafe { getgroups(groupNumber, cp2) }

        var local: UInt32 = 0
        for (temp in 0..groupNumber) {
            unsafe { local = cp2.read(Int64(temp)) }
            str += "${temp}" + ":" + "${local}"
            if (temp < groupNumber - 1) {
                str += "\n"
            }
        }
        // free manually allocated space
        unsafe { free(a) }
        unsafe { free(a2) }

        @Expect(str, hostName)
        Process.current.removeEnv("TEMP_RES")
    }
}
