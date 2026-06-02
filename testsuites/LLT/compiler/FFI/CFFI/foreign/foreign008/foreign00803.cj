// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %ulimit-error %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan Hello, world!
// ASSERT: scan Hello, 1, !!
// ASSERT: scan Hello, 0


foreign func printf(fmt: CString, ...): Unit

main() {
    var arr = Array<Int64>(10, repeat: 0)
    unsafe {
        var tempFormatCS: CString
        var tempCStringValue: CString

        tempFormatCS = LibC.mallocCString("Hello, %s\n")
        tempCStringValue = LibC.mallocCString("world!")
        printf(tempFormatCS, tempCStringValue)
        unsafe { LibC.free(tempFormatCS) }
        unsafe { LibC.free(tempCStringValue) }

        tempFormatCS = LibC.mallocCString("Hello, %d, %s\n")
        tempCStringValue = LibC.mallocCString("!!")
        printf(tempFormatCS, 1, tempCStringValue)
        unsafe { LibC.free(tempFormatCS) }
        unsafe { LibC.free(tempCStringValue) }

        tempFormatCS = LibC.mallocCString("Hello, %ld\n")
        printf(tempFormatCS, CPointer<Int8>())
        unsafe { LibC.free(tempFormatCS) }
    }
    0
}
