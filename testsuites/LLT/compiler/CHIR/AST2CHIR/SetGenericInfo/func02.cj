// LEVEL: 0
// EXEC: %compiler %dumpCHIRDebug %cmp_opt %f -o %output
// (not Windows)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/0\_AST\_CHIR.chirtxt | compare %f

func foo<T>(param!: Int32 = 1) {

}

main() {
    var a = foo<Int64>()
    var b = foo<Int32>()
    return 0
}

// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIlEi\$param_0v.* genericDecl: _CN7default3fooIGTEEi\$param_0v
// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIiEi\$param_0v.* genericDecl: _CN7default3fooIGTEEi\$param_0v
// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIlEi.* genericDecl: _CN7default3fooIGTEEi
// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIiEi.* genericDecl: _CN7default3fooIGTEEi
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIlEi\$param_0v.* genericDecl: _ZN7default3fooIGTEEi\$param_0v
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIiEi\$param_0v.* genericDecl: _ZN7default3fooIGTEEi\$param_0v
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIlEi.* genericDecl: _ZN7default3fooIGTEEi
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIiEi.* genericDecl: _ZN7default3fooIGTEEi

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
