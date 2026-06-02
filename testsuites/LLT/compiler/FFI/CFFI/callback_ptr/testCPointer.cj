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


internal import std.time.*

foreign func free(ptr: CPointer<Int32>): Unit

@C
func testParse(a : CPointer<Int32>, b : CPointer<Int32>) : Unit {
    unsafe { print(a.read().toString() + "\n") }
    unsafe { print(b.read().toString() + "\n") }
}



let testParse1:CFunc<(CPointer<Int32>, CPointer<Int32>) -> Unit> = {a : CPointer<Int32>, b : CPointer<Int32> =>
    unsafe { print(a.read().toString() + "\n") }
    unsafe { print(b.read().toString() + "\n") }
}

foreign func getCPtrInt(): CPointer<Int32>
foreign func fuzz2(cb: CFunc<(CPointer<Int32>, CPointer<Int32>)->Unit>) : Int32

main() : Int64 {
    var a = unsafe { getCPtrInt() }
    var b = unsafe { getCPtrInt() }
    unsafe { testParse(a, b) }
    unsafe { testParse1(a, b) }
    unsafe { free(a) }
    unsafe { free(b) }

    unsafe { fuzz2(testParse1) }
    unsafe { fuzz2(testParse)  }
    0
}
