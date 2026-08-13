// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableConstPropagation %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_ConstantPropagation.chirtxt "Func @_CN7default3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Trivial RShift: result uses are replaced by Load(a).
// ASSERT: regex %(\d+): Int64 = Load\(@_CN7default1aE\)[\s\S]*?Store\(%\1, %0\)
// ASSERT: scan RShift(

var a = 111

func foo(): Int64 {
    a >> 0
}

main() {
    foo()
    0
}
