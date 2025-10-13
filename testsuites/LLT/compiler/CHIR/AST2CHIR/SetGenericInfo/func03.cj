// LEVEL: 0
// EXEC: %compiler %dumpCHIRDebug %cmp_opt %f -o %output
// (not Windows)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/0\_AST\_CHIR.chirtxt | compare %f

func foo<T>(param0: Int8, param1!: Int8 = 1, param2!: Int16 = 2) {

}

main() {
    var a = foo<Int64>(1)
    var b = foo<Int32>(2)
    return 0
}

// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIlEaas\$param2_2aa.* genericDecl: _CN7default3fooIGTEEaas\$param2_2aa
// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIiEaas\$param2_2aa.* genericDecl: _CN7default3fooIGTEEaas\$param2_2aa
// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIlEaas.* genericDecl: _CN7default3fooIGTEEaas
// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIiEaas.* genericDecl: _CN7default3fooIGTEEaas
// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIlEaas\$param1_1a.* genericDecl: _CN7default3fooIGTEEaas\$param1_1a
// (CJNATIVE) ASSERT: regex Func @_CN7default3fooIiEaas\$param1_1a.* genericDecl: _CN7default3fooIGTEEaas\$param1_1a

// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIlEaas\$param2_2aa.* genericDecl: _ZN7default3fooIGTEEaas\$param2_2aa
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIiEaas\$param2_2aa.* genericDecl: _ZN7default3fooIGTEEaas\$param2_2aa
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIlEaas.* genericDecl: _ZN7default3fooIGTEEaas
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIiEaas.* genericDecl: _ZN7default3fooIGTEEaas
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIlEaas\$param1_1a.* genericDecl: _ZN7default3fooIGTEEaas\$param1_1a
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3fooIiEaas\$param1_1a.* genericDecl: _ZN7default3fooIGTEEaas\$param1_1a

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
