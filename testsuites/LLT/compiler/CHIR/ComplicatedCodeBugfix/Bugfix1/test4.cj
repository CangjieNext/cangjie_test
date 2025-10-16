// LEVEL: 0
// DEPENDENCE: h1
// EXEC:%compiler h1/test1.cj %compile_lib_opt -o test1.%middle
// EXEC:%compiler test1.%middle %n.cj -o %output
// EXEC: %run %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

internal import h1.*

main() {
    func31<Int16, Range<Int32>>(1);
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
