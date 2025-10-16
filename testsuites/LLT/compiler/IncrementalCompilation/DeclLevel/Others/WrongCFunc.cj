// EXEC-PIPE-1: %compiler %cmp_opt -Woff unused %f 2>&1 | compare %f
// ASSERT: scan-not core dumped

@C
struct F {
    let d   : CFunc<CPointer<Int8>> -> Unit = 
    { ptr => println("call from cj lambda") }
}
main(): Unit {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
