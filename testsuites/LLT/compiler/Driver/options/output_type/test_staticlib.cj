// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/** 
 * Test whether --output-type=staticlib behaves correctly (1.4.1)
 * Test whether the default output filename is package name (1.4.1)
 */

//  DEPENDENCE: ../src/src00/p1 ../src/src00/main_p1.cj
//  EXEC: %compiler -p p1 --output-type=staticlib
//  EXEC: %compiler main_p1.cj libp1.a -o %output
//  EXEC: %output | compare %f
//  ASSERT: scan Hello cangjie!
