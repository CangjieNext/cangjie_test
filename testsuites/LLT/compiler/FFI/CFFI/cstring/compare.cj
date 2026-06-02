// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-PIPE-0: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex-3 Exception: The two CString values to be compared cannot be null.


main(): Int64 {
    var s1 = unsafe {LibC.mallocCString("")}
    var s2 = CString(CPointer<UInt8>())

    try { s1.compare(s2) } catch(e: Exception) { println(e) }
    try { s2.compare(s2) } catch(e: Exception) { println(e) }
    try { s2.compare(s1) } catch(e: Exception) { println(e) }

    unsafe { 
        LibC.free(s1)
    }
    return 0
}