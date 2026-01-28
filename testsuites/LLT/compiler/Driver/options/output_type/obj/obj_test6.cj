// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: obj_main.cj
// EXEC: %compiler obj_main.cj --output-type=obj -o main.o --experimental --compile-target=dylib
// EXEC-PIPE-1: %compiler main.o -lcangjie-std-core --experimental -o %output 2>&1 | compare %f
// (Windows) ASSERT: scan undefined symbol: WinMain
// (Mac) ASSERT: scan undefined symbol: _main
// (Linux)ASSERT: regex undefined reference to .*main.*