// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: GetPtr.cpp
// EXEC: %clang %clang_shared_opt GetPtr.cpp -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output %run_args | compare %f

// ASSERT: scan pass to CJ a: 3
// ASSERT: regex first: 3
// ASSERT: regex first: 4
// ASSERT: regex first: 5
// ASSERT: regex second: 3
// ASSERT: regex second: 4
// ASSERT: regex second: 5


foreign func getCPtrIntt(): CPointer<Int32>
foreign func free(ptr: CPointer<Int32>): Unit

main() {
    var iptr:CPointer<Int32> = unsafe{ getCPtrIntt() }
    var index = 0
    while (true) {
        var c = unsafe { iptr.read(index) }
        print("first: ${c}\n")
        if (c == 5) {
            break
        }
        index++
    }

    var index1 = 0
    while (true) {
       var c = unsafe { iptr.read(index1) }
       print("second: ${c}\n")
       if (c == 5) {
           break
       }
       index1++
    }
    unsafe { free(iptr) }

   return 0
}
