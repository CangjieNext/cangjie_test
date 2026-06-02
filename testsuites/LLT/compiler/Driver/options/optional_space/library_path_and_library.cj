// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/src00/p1 ../src/src00/main_p1.cj
// (CJNATIVE) EXEC:%compiler -p p1 --output-type=dylib
//  EXEC:%compiler main_p1.cj -L. -lp1 -o %output
//  EXEC:%pwd_to_ld_path %output | compare %f
//  ASSERT: scan Hello cangjie!
