// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../src/src00/p1
// EXEC:%compiler %cmp_opt -p p1 --output-type=dylib
// EXEC: %ls | compare %f
// (Windows) ASSERT: scan libp1.dll
// (Linux) ASSERT: scan libp1.so
// (Darwin) ASSERT: scan libp1.dylib
// ASSERT: scan p1.cjo

