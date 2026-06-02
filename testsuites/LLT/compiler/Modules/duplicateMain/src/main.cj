// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: ../../duplicateMain
// EXEC: %compiler %pkg_opt duplicateMain/src/test %compile_lib_opt -o libtest.%middle 
// EXEC: %compiler %pkg_opt duplicateMain/src libtest.%middle 2>&1 | compare %f
// ASSERT: regex multiple 'main's are found in source files
internal import test.*

main() {
    0
}

main(a: List<String>): Unit {}
