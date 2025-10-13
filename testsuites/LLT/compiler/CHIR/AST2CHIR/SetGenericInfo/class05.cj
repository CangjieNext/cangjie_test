// LEVEL: 0
// EXEC: %compiler %dumpCHIRDebug %cmp_opt %f -o %output
// (not Windows)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/0\_AST\_CHIR.chirtxt | compare %f

class AAA<T> {
    func foo5<U>(param3 !: Option<U> = Option<U>.None) {}
}

main() {
    var a = AAA<Int64>()
    var b = AAA<Int32>()
    return 0
}

// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl6<init>Hv.* genericDecl: _CN7default3AAAIGTE6<init>Hv
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIi6<init>Hv.* genericDecl: _CN7default3AAAIGTE6<init>Hv
// (CJNATIVE) ASSERT: regex-not Func @_CN7default3AAAIl4foo5IGUEENN8std\.core6OptionIGUEE\$param3_0v.* genericDecl: _CN7default3AAAIGTE4foo5IGUEENN8std\.core6OptionIGUEE\$param3_0v
// (CJNATIVE) ASSERT: regex-not Func @_CN7default3AAAIi4foo5IGUEENN8std\.core6OptionIGUEE\$param3_0v.* genericDecl: _CN7default3AAAIGTE4foo5IGUEENN8std\.core6OptionIGUEE\$param3_0v
// (CJNATIVE) ASSERT: regex class @_CN7default3AAAIlE.* genericDecl: _CN7default3AAAIGTEE
// (CJNATIVE) ASSERT: regex class @_CN7default3AAAIiE.* genericDecl: _CN7default3AAAIGTEE
// (CJNATIVE) ASSERT: regex-not Func @_CN7default3AAAIl4foo5IGUEENN8std\.core6OptionIGUEE.* genericDecl: _CN7default3AAAIGTE4foo5IGUEENN8std\.core6OptionIGUEE
// (CJNATIVE) ASSERT: regex-not Func @_CN7default3AAAIi4foo5IGUEENN8std\.core6OptionIGUEE.* genericDecl: _CN7default3AAAIGTE4foo5IGUEENN8std\.core6OptionIGUEE

// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl6<init>Ev.* genericDecl: _ZN7default3AAAIGTE6<init>Ev
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIi6<init>Ev.* genericDecl: _ZN7default3AAAIGTE6<init>Ev
// (not CJNATIVE) ASSERT: regex-not Func @_ZN7default3AAAIl4foo5IGUEEN_ZN8std\.core6OptionIGUEE\$param3_0v.* genericDecl: _ZN7default3AAAIGTE4foo5IGUEEN_ZN8std\.core6OptionIGUEE\$param3_0v
// (not CJNATIVE) ASSERT: regex-not Func @_ZN7default3AAAIi4foo5IGUEEN_ZN8std\.core6OptionIGUEE\$param3_0v.* genericDecl: _ZN7default3AAAIGTE4foo5IGUEEN_ZN8std\.core6OptionIGUEE\$param3_0v
// (not CJNATIVE) ASSERT: regex class @_ZN7default3AAAIlE.* genericDecl: _ZN7default3AAAIGTEE
// (not CJNATIVE) ASSERT: regex class @_ZN7default3AAAIiE.* genericDecl: _ZN7default3AAAIGTEE
// (not CJNATIVE) ASSERT: regex-not Func @_ZN7default3AAAIl4foo5IGUEEN_ZN8std\.core6OptionIGUEE.* genericDecl: _ZN7default3AAAIGTE4foo5IGUEEN_ZN8std\.core6OptionIGUEE
// (not CJNATIVE) ASSERT: regex-not Func @_ZN7default3AAAIi4foo5IGUEEN_ZN8std\.core6OptionIGUEE.* genericDecl: _ZN7default3AAAIGTE4foo5IGUEEN_ZN8std\.core6OptionIGUEE

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
