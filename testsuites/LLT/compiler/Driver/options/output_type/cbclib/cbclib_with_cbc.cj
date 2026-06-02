// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not CJNATIVE) DEPENDENCE: ../../src/module02/src/main.cj ../../src/module02/src/p1 ../../src/module02/src/p2
// (not CJNATIVE) EXEC:%compiler -p p1 --output-type=cbclib -o libp1.%cj_dylib_suffix
// (not CJNATIVE) EXEC:%compiler -p p2 --output-type=cbclib -o libp2.%cj_dylib_suffix
// (not CJNATIVE) EXEC:%compiler --output-type=cbc main.cj libp1.%symbol_file_suffix libp2.%symbol_file_suffix -o %n.%cj_dylib_suffix
// (not CJNATIVE) EXEC:%cj_tool --cbc-path . %n.%cj_dylib_suffix | compare %f
// (not CJNATIVE) ASSERT: scan Hello cangjie!
