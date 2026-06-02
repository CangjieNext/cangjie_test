// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) DEPENDENCE: ../../src/module02/src/main.cj ../../src/module02/src/p1 ../../src/module02/src/p2
// (not CJNATIVE) EXEC:%compiler -p p1 --output-type=cbclib
// (not CJNATIVE) EXEC:%compiler -p p2 --output-type=cbclib
// (not CJNATIVE) EXEC:%compiler --output-type=cbc main.cj p2.pdba p1.pdba -o main.cbc
// (not CJNATIVE) EXEC-PIPE:%cj_tool --cbc-path . main.cbc | compare %f
// (not CJNATIVE) ASSERT: scan Hello cangjie!
