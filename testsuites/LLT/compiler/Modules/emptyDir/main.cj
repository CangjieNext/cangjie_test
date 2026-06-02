// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %mkdir ./project1/src/A/B/C
// EXEC: %compiler %pkg_opt %compile_lib_opt ./project1/src/A/B/C -o libarithmatic.%middle | compare %f
// ASSERT: regex-not error
// ASSERT: regex-not core dumped

main(): Int64 {
    return 0
}
