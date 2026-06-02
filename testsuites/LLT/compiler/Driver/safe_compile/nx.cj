// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %f -o %output
// (Linux and CJNATIVE) EXEC: objdump -p %output | grep -A 1 STACK | grep rw-

// (Windows and CJNATIVE) EXEC: objdump -p %output | find "DllRuneacteristics" | find "00000160"
// 00000160 means combination of HIGH_ENTROPY_VA, DYNAMIC_BASE, NX_COMPAT flags

// (not CJNATIVE) EXEC: %compiler --link-options="-z noexecstack" %f -o %output
// EXEC: %run %run_opt %output

main() {
    println("Hello")
}
