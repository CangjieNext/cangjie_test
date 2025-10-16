// LEVEL: 0
// EXEC: %compiler %dumpCHIRDebug %cmp_opt %f -o %output
// (not Windows)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/0\_AST\_CHIR.chirtxt | compare %f

func foo<T>() {

}

main() {
    var a = foo<Int64>()
    var b = foo<Int32>()
    return 0
}

// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIlEv.* genericDecl: _CN7default3fooIGTEEv
// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIiEv.* genericDecl: _CN7default3fooIGTEEv
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIlEv.* genericDecl: _ZN7default3fooIGTEEv
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIiEv.* genericDecl: _ZN7default3fooIGTEEv

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
