// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/** 
 * Test whether --output-type=staticlib behaves correctly
 * Test whether the object file name not have random number
 */

//  DEPENDENCE: ../src/main.cj
//  EXEC: %compiler main.cj --output-type=staticlib -o libmain.a
//  EXEC: ar t libmain.a | compare %f
//  ASSERT: scan main.o
