// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../p1 ../p2
//  EXEC:%compiler %pkg_opt %compile_lib_opt p2 -o p2.o
//  EXEC:%compiler %pkg_opt %compile_lib_opt p1 -o p1.o
//  EXEC:%compiler %f p1.o p2.o -o %output
//  EXEC:%output

internal import p1.*

main() {
    return 0
}
