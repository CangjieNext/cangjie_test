// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../src/module02/src/main.cj ../../src/module02/src/p1 ../../src/module02/src/p2
// (not CJNATIVE) EXEC:%compiler -p p1 --output-type=staticlib
// (not CJNATIVE) EXEC:%compiler -p p2 --output-type=staticlib
// (not CJNATIVE) EXEC:%compiler main.cj p1.bc p2.bc -o %output
// (not CJNATIVE) EXEC: %run %output | compare %f
// (not CJNATIVE) ASSERT: scan Hello cangjie!
