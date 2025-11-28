// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f %dumpCHIRDebug -o %output
// EXEC-PIPE-0: %cat %n\_CHIR/[0-9]*\_Canonicalization.chirtxt | compare %f
// ASSERT: regex from <std.core>.*\[noSideEffect\].* @_CNatXNNat8OrderingE7compareHY1_.* loc: "comparable.cj"-282-5
// ASSERT: regex from <std.core>.*\[noSideEffect\].* @_CNatXl8hashCodeHv.* loc: "hashable.cj"-88-5
// ASSERT: regex from <std.core>.*\[noSideEffect\].* @_CNatXd8hashCodeHv.* loc: "hashable.cj"-252-5
// ASSERT: regex from <std.core>.*\[noSideEffect\].* @_CNat6String7compareHRNatY0_E.* loc: "string.cj"-1017-5
// ASSERT: regex from <std.math>.*\[noSideEffect\].* @_CNbg5roundHd.* loc: "math_funcs.cj"-2161-1
// ASSERT: regex from <std.math>.*\[noSideEffect\].* @_CNbg5roundHf.* loc: "math_funcs.cj"-2197-1
// ASSERT: regex from <std.math>.*\[noSideEffect\].* @_CNbg5roundHDh.* loc: "math_funcs.cj"-2233-1
// ASSERT: regex \[noSideEffect\].* Func @_CNat6StringeqHRNatY0_E.* loc: "string.cj"-1117-5

import std.math.*

main() {
    0
}