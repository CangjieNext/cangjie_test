// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/** 
 * Test whether --library-path & --library behave correctly (1.4.1)
 */
 
// DEPENDENCE: ../src/module02/src/main.cj ../src/module02/src/p1 ../src/module02/src/p2
//  EXEC:%compiler -p p1 --output-type=dylib -o libp1.%dylib_suffix
//  EXEC:%compiler -p p2 --output-type=dylib -o libp2.%dylib_suffix
//  EXEC:%compiler main.cj --library-path . --library p1 --library p2 -o %output | compare %f
//  ASSERT: regex-not warning.*is specified multiple times
//  EXEC:%pwd_to_ld_path %output
