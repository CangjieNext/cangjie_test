// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Windows) DEPENDENCE: generate_testfile.py
// (Windows) EXEC: %python generate_testfile.py
// (Windows) EXEC-1: test.bat 2>&1 | compare %f
// (Windows) ASSERT: regex error: the path length for .* exceeds the system limit \(260 characters\)
