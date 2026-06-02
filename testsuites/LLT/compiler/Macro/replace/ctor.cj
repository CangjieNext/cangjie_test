// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f  -o %output
// ASSERT: scan expected declaration, found 'C1'
// ASSERT: scan expected declaration, found 'C2'
// ASSERT: scan expected declaration, found 'C3'
// ASSERT: scan expected declaration, found 'C4'

internal import test.*
struct C0 {
    C1(){}
}

struct C1 {
    @callTest
    C2(){}
}

class C2 {
    C3(){}
}

class C3 {
    @callTest
    C4(){}
}

main() {}

