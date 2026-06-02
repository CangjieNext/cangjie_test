// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: p1
// EXEC-PIPE-0:%compiler p1/test0.cj %compile_lib_opt -o test0.%middle
// EXEC-PIPE-0:%compiler test0.%middle test1.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

import test0

const func printMessage(message: String) {}

@test0.MyAnn4[r'a', printMessage]
class C4 {}

main() {
    return 0
}
