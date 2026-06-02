// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: fuzz.c
// EXEC: %clang %clang_shared_opt fuzz.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan 3
// ASSERT: scan 4


foreign func getCPtrInt(): CPointer<Int32>
foreign func printPtr(a:CPointer<Int32>): Unit
foreign func printf(fmt: CString, ...): Int32
foreign func free(ptr: CPointer<Int32>): Unit

main() : Int64 {
    var a = unsafe { getCPtrInt() }
    var b = unsafe { getCPtrInt() }
    var c = CPointer<Int32>()
    var d = CPointer<Int32>(b)

    unsafe {
        var aInt32 = a.read()
        print("3:${aInt32} ${d.toUIntNative()}\n")
        a.write(42)
        var aInt322 = a.read()
        print("42:${aInt32} ${a.toUIntNative()}\n")
        if(a.isNull()){print("error\n")}
        print("address should not change: ${a.toUIntNative()}\n")
        if(c.isNull()){
            var tempCS = LibC.mallocCString("%p \n")
            printf(tempCS,a)
            LibC.free(tempCS)
            printPtr(a)
            printPtr(b)
            printPtr(c)
            printPtr(d)
        }
        free(a)
        free(b)
    }
    0
}
