// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./src
// EXEC: %rmdir ccc && mkdir ccc
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt ./src/aac -o ccc/
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt ./src/aab -o ccc/
// EXEC: %compiler %cmp_opt %compile_lib_opt %pkg_opt ./src/aaa --import-path ccc -o ccc/
