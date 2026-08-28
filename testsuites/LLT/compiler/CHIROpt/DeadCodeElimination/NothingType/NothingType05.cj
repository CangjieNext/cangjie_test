// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../../pick_defination.py
// EXEC: %compiler %cmp_opt %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_NothingTypeExprElimination.chirtxt" "Func @_CN7default3fooHllnll" | compare %f
// RUN-EXEC-PIPE-0: %run main
// Nothing-typed param marks func skip: vic after NothingTypeExprElimination.
// ASSERT: scan srcCodeIdentifier: foo
// ASSERT: scan skip: vic

func foo(a: Int64, b: Int64, c: Nothing, d: Int64, e:Int64) {1}

main() : Int64 {
    return 0
}
