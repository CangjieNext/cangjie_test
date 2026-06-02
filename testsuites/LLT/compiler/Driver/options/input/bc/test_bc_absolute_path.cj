// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../src/module02/src/main.cj ../../src/module02/src/p1 ../../src/module02/src/p2
// (not CJNATIVE) EXEC:mkdir temp
// (not CJNATIVE) EXEC:%compiler -p p1 --output-type=staticlib -o temp/p1.bc
// (not CJNATIVE) EXEC:%compiler -p p2 --output-type=staticlib -o temp/p2.bc
// (not CJNATIVE) EXEC:%compiler main.cj temp/../temp/p1.bc temp/../temp/p2.bc -o %output %verbose_opt | compare %f
// (not CJNATIVE) ASSERT: regex-not jc'.* temp/../temp/p1.bc
// (not CJNATIVE) ASSERT: scan-not jc'.* temp/../temp/p2.bc
