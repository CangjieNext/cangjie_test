// EXEC: %compiler %cmp_opt %dumpCHIRDebug %f -o %output
// (Linux and CJNATIVE) EXEC: sed -n -r '/Func @_CN7default3fooHllnll/,/^}$/p' NothingType05_CHIR_Debug/[0-9]*\_NothingTypeExprElimination.chirtxt | compare %f
// ASSERT: regex Func @_CN7default3fooHllnll\(.*\).* // .* skip: vic,

func foo(a: Int64, b: Int64, c: Nothing, d: Int64, e:Int64) {1}

main() : Int64 {
    return 0
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
