// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %rmdir ./tmps && mkdir ./tmps
// EXEC: %compiler %cmp_opt %f %save_temps_opt ./tmps
// EXEC-PIPE: %ls ./tmps | compare %f
// ASSERT: regex .*\.chir

main() {
    println("hello world")
}
