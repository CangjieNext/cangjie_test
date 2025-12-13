// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %dumpCHIRDebug
// EXEC: %cat default_CHIR/[0-9]*_ClosureConversion.chirtxt | compare %n.cj
// ASSERT: scan Func @_CGV7default3aaaHv() : Void
// ASSERT: scan Func @_CGV7default3bbbHv() : Void
// ASSERT: scan Func @_CGF7defaultU00000000IrhyTiiHv() : Void
// ASSERT: scan Func @_CGP7defaultiiHv() : Void
// ASSERT: scan Void = Apply(@_CGV7default3aaaHv)
// ASSERT: scan Void = Apply(@_CGV7default3bbbHv)

func foo(): Int64 { return 0 }

var aaa = foo()
var bbb = if (aaa == 1) { true } else { false }

main() {
    0
}