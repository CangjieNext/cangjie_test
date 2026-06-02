// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan call_in_cj(
func foo() {
    throw Exception()
}

@C
func call_in_cj() {
    print("xxxx\n")
    foo()
    print("end\n")
}

main() {
    unsafe {
        call_in_cj()
    }
    0
}
