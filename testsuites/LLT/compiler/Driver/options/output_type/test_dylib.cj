// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/** 
 * Test whether --output-type=dylib behaves correctly (1.4.1)
 * Test whether the default output filename is package name (1.4.1)
 */
 
// DEPENDENCE: ../src/src00/p1 ../src/src00/main_p1.cj
//  EXEC:%compiler -p p1 --output-type=dylib
//  EXEC:%compiler main_p1.cj -L . -l p1 -o %output
//  EXEC:%pwd_to_ld_path %output | compare %f
//  ASSERT: scan Hello cangjie!
