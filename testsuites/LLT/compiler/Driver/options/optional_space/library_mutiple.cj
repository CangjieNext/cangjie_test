// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/module02/src/main.cj ../src/module02/src/p1 ../src/module02/src/p2
//  EXEC:%compiler -p p1 --output-type=dylib -o libp1.%dylib_suffix
//  EXEC:%compiler -p p2 --output-type=dylib -o libp2.%dylib_suffix
//  EXEC:%compiler main.cj -L. -lp1 -lp2 -o %output
//  EXEC:%pwd_to_ld_path %output | compare %f
//  ASSERT: scan Hello cangjie!
