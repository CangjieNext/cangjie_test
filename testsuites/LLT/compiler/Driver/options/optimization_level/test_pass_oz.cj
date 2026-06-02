// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: %compiler %verbose_opt -O1 -Oz %f 2>&1 -o %output | compare %f
//  ASSERT: regex opt(.exe)?['"] .*-passes=default<Oz>
//  ASSERT: regex llc(.exe)?['"] .*-O2
//  EXEC: %run %run_opt %output %run_args

main() {
    println("Hello")
    return 0
}
