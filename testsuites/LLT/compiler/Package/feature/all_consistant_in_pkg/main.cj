// DEPENDENCE: src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/feature.cj src/hello.cj -o src.%middle
// EXEC: %compiler %cmp_opt src.%middle main.cj -o %output 
// EXEC-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan Hello, features!
internal import src.*

main() {
    println(helloFeatures())
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
