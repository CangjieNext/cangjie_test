// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  EXEC: mkdir path_to_my_custom_gcc_libs
//  EXEC: %touch path_to_my_custom_gcc_libs/crtendS.o
//  EXEC: %compiler %cmp_opt %verbose_opt %f -B./path_to_my_custom_gcc_libs 2>&1 | compare %f
//  ASSERT: regex ld' .*path_to_my_custom_gcc_libs/crtendS.o

main() {
    return 0
}
