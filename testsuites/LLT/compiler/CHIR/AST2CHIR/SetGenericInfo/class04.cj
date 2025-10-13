// LEVEL: 0
// EXEC: %compiler %dumpCHIRDebug %cmp_opt %f -o %output
// (not Windows)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/0\_AST\_CHIR.chirtxt | compare %f

class AAA<T> {
    func foo4(param2 !: Option<T> = Option<T>.None) {}
}

main() {
    var a = AAA<Int64>()
    var b = AAA<Int32>()
    return 0
}

// (CJNATIVE) ASSERT: regex class @_CN7default3AAAIlE.* genericDecl: _CN7default3AAAIGTEE
// (CJNATIVE) ASSERT: regex class @_CN7default3AAAIiE.* genericDecl: _CN7default3AAAIGTEE
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl6<init>Hv.* genericDecl: _CN7default3AAAIGTE6<init>Hv
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIi6<init>Hv.* genericDecl: _CN7default3AAAIGTE6<init>Hv
// (not CJNATIVE) ASSERT: regex class @_ZN7default3AAAIlE.* genericDecl: _ZN7default3AAAIGTEE
// (not CJNATIVE) ASSERT: regex class @_ZN7default3AAAIiE.* genericDecl: _ZN7default3AAAIGTEE
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl6<init>Ev.* genericDecl: _ZN7default3AAAIGTE6<init>Ev
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIi6<init>Ev.* genericDecl: _ZN7default3AAAIGTE6<init>Ev
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl4foo4ENN8std\.core6OptionIlE.* genericDecl: _CN7default3AAAIGTE4foo4ENN8std\.core6OptionIGTEE
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIi4foo4ENN8std\.core6OptionIiE.* genericDecl: _CN7default3AAAIGTE4foo4ENN8std\.core6OptionIGTEE
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl4foo4ENN8std\.core6OptionIlE\$param2_0v.* genericDecl: _CN7default3AAAIGTE4foo4ENN8std\.core6OptionIGTEE\$param2_0v
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIi4foo4ENN8std\.core6OptionIiE\$param2_0v.* genericDecl: _CN7default3AAAIGTE4foo4ENN8std\.core6OptionIGTEE\$param2_0v
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl4foo4EGRrecord._ZN8std\.core6OptionIlE.* genericDecl: _ZN7default3AAAIGTE4foo4EGC_ZN8std\.core6OptionIGTEE
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIi4foo4EGRrecord._ZN8std\.core6OptionIiE.* genericDecl: _ZN7default3AAAIGTE4foo4EGC_ZN8std\.core6OptionIGTEE
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl4foo4EGRrecord._ZN8std\.core6OptionIlE\$param2_0v.* genericDecl: _ZN7default3AAAIGTE4foo4EGC_ZN8std\.core6OptionIGTEE\$param2_0v
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIi4foo4EGRrecord._ZN8std\.core6OptionIiE\$param2_0v.* genericDecl: _ZN7default3AAAIGTE4foo4EGC_ZN8std\.core6OptionIGTEE\$param2_0v

// (CJNATIVE) ASSERT: regex enum @_CN8std\.core6OptionIlE.* genericDecl: _CN8std\.core6OptionIGTEE
// (CJNATIVE) ASSERT: regex enum @_CN8std\.core6OptionIiE.* genericDecl: _CN8std\.core6OptionIGTEE
// (not CJNATIVE) ASSERT: regex enum @_ZN8std\.core6OptionIlE.* genericDecl: _ZN8std\.core6OptionIGTEE
// (not CJNATIVE) ASSERT: regex enum @_ZN8std\.core6OptionIiE.* genericDecl: _ZN8std\.core6OptionIGTEE
// (CJNATIVE) ASSERT: regex Func @_CN8std\.core6OptionIl6isSomeEv.* genericDecl: _CN8std\.core6OptionIGTE6isSomeEv
// (not CJNATIVE) ASSERT: regex \[public\] \[imported\] func @_ZN8std\.core6OptionIl6isSomeEv: \(Enum-_ZN8std\.core6OptionIlE<Int64>\) -> Bool
// (CJNATIVE) ASSERT: regex Func @_CN8std\.core6OptionIi6isSomeEv.* genericDecl: _CN8std\.core6OptionIGTE6isSomeEv
// (not CJNATIVE) ASSERT: regex Func @_ZN8std\.core6OptionIi6isSomeEv.* genericDecl: _ZN8std\.core6OptionIGTE6isSomeEv
// (CJNATIVE) ASSERT: regex Func @_CN8std\.core6OptionIl6isNoneEv.* genericDecl: _CN8std\.core6OptionIGTE6isNoneEv
// (not CJNATIVE) ASSERT: regex \[public\] \[imported\] func @_ZN8std\.core6OptionIl6isNoneEv: \(Enum-_ZN8std\.core6OptionIlE<Int64>\) -> Bool
// (CJNATIVE) ASSERT: regex Func @_CN8std\.core6OptionIi6isNoneEv.* genericDecl: _CN8std\.core6OptionIGTE6isNoneEv
// (not CJNATIVE) ASSERT: regex Func @_ZN8std\.core6OptionIi6isNoneEv.* genericDecl: _ZN8std\.core6OptionIGTE6isNoneEv


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
