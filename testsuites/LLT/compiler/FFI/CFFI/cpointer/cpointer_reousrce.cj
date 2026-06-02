// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -o %output
// EXEC-PIPE-0: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan 10

foreign func printf(fmt: CString, ...): Int32

main() {
    unsafe {
    try(cr = LibC.malloc<Int64>().asResource()) {
        cr.value.write(10)
        println(cr.value.read())
    }
    }
    0
}