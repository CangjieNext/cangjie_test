// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
//  EXEC-PIPE-0: %compiler %cmp_opt main.cj --static-libs -o %output
//  EXEC: %ldd %output 2>&1 | compare %f
// (Linux and CJNATIVE) ASSERT: scan-not cangjie-std-core.so
// (Darwin and CJNATIVE) ASSERT: scan-not cangjie-std-core.dylib
// (Windows and CJNATIVE) ASSERT: scan-not cangjie-std-core.dll
