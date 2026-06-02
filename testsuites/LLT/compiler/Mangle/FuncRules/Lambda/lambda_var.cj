// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (CJNATIVE) EXEC: %compiler %cmp_opt %f --save-temps . --apc=1 -Woff unused --output-type=staticlib
// (CJNATIVE) EXEC: %llvmDissembler %n.bc -o %n.ll
// (CJNATIVE) EXEC: %cat %n.ll 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal void @_CN10lambda_var7displayL_E
// (CJNATIVE) ASSERT: scan define internal void @_CN10lambda_var5f2ResL_E
// (CJNATIVE) ASSERT: scan define internal void @_CGV10lambda_var2f1Hv

package lambda_var

func f2(lam: () -> Unit) {}

var display = {=> println("Hello")}
let f2Res = f2 {println("World")} // OK to omit the =>
let f1 = {a: Int64, b: Int64 => a + b}

main() {
    0
}
