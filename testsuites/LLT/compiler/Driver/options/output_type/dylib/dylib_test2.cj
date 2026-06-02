// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg.cj
// EXEC: %compiler %cmp_opt --output-type=dylib pkg.cj
// EXEC: %ls | compare %f
// (Windows) ASSERT: scan libpkg.dll
// (Linux) ASSERT: scan libpkg.so
// (Darwin) ASSERT: scan libpkg.dylib
// ASSERT: scan pkg.cjo

