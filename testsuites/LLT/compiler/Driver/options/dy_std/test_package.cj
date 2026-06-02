// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/src00/main_p1.cj ../src/src00/p1
//  EXEC: %compiler -p p1 --dy-std --dy-libs --output-type=staticlib
//  EXEC: %compiler main_p1.cj --dy-std --dy-libs -L . -l p1 -o %output
//  EXEC-0: %output
//  EXEC: %ldd %output | compare %f
// (Linux and CJNATIVE) ASSERT: scan cangjie-std-core.so
// (Darwin and CJNATIVE) ASSERT: scan cangjie-std-core.dylib
// (Windows and CJNATIVE) ASSERT: scan cangjie-std-core.dll
