// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-PIPE-0: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 123
// ASSERT: scan true

foreign func printf(fmt: CString, ...): Int32

main() {
    unsafe {
    try(cr = LibC.mallocCString("123\n").asResource()) {
        printf(cr.value)
    }
    try(cr = CString(CPointer<UInt8>()).asResource()) {
        println(cr.value.isNull())
    }
    }
    0
}
