// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int8 {
    return 0
}

foreign func `main`(value: Int8): Unit

// ASSERT: scan a foreign function cannot be named 'main' because the symbol is reserved for the program entry
// ASSERT: scan 1 error generated, 1 error printed.
// ASSERT: scan-not Internal Compiler Error
