// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_UselessFuncElimination.chirtxt" WHOLE | compare %f
// RUN-EXEC-PIPE-0: %run main
// Unused const binding temp may be cleaned; test1 kept as compileTimeVal.
// ASSERT: scan srcCodeIdentifier: main
// ASSERT: scan srcCodeIdentifier: test1

const func test1() {
    1
}

const func temp() {
    const a = test1
}

main() {
    return 0
}
