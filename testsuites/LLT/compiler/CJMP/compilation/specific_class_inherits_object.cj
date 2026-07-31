// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression test: specific class in common part must have implicit Object superclass
// set up in CHIR. See TranslateClassDecl.cpp::needInitialSuperClassSetup.
// Uses chir-dis + grep to inspect the serialized CHIR directly — catches the bug
// even in Release builds where the CHIR well-formedness checker is compiled out.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
// EXEC-0: %chirDis c/cmp.chir
// EXEC-0: grep "1BE <:" cmp.chirtxt
package cmp

public specific class B {
    public init() {}
}
