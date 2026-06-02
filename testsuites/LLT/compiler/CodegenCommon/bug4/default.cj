// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ./src
// EXEC: %rmdir bin && %mkdir bin
// EXEC: %compiler %pkg_opt ./src/util -o libutil.%middle %compile_lib_opt
// EXEC: %compiler %pkg_opt ./src -o bin/ libutil.%middle
// (Linux) EXEC: %run ./bin/%main
// (Windows) EXEC: %run .\bin\%main
