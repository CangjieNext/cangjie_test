// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: mkdir path_to_my_custom_gcc_libs
// (CJNATIVE) EXEC: %touch path_to_my_custom_gcc_libs/crtbeginS.o
// Note: We do not check the return code of `cjc` command here. It 
// (CJNATIVE) EXEC: %compiler %cmp_opt %verbose_opt %f -B./path_to_my_custom_gcc_libs | compare %f
// (CJNATIVE) ASSERT: regex ld['"] .*path_to_my_custom_gcc_libs/crtbeginS.o

main() {
    return 0
}
