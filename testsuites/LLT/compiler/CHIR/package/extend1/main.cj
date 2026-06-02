// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: p1
// DEPENDENCE: p2
// EXEC:%compiler p1/file1.cj %compile_lib_opt -o p1.%middle
// EXEC:%compiler p1.%middle p2/file2.cj -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
