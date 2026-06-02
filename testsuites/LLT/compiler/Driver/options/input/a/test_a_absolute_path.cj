// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../p1 ../p2
//  EXEC:mkdir temp
//  EXEC:%compiler %pkg_opt %compile_lib_opt p2 -o temp/p2.a
//  EXEC:%compiler %pkg_opt %compile_lib_opt --import-path=temp p1 -o temp/p1.a
//  EXEC:%compiler %f --import-path=temp temp/../temp/p1.a temp/../temp/p2.a -o %output %verbose_opt | compare %f
//  ASSERT: regex-not ld'.* temp/../temp/p1.a
//  ASSERT: scan-not ld'.* temp/../temp/p2.a

internal import p1.*

main() {
    return 0
}
