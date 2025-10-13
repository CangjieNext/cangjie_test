// LEVEL: 0
// EXEC: %compiler %dumpCHIRDebug %cmp_opt %f -o %output
// (not Windows)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/0\_AST\_CHIR.chirtxt | compare %f

interface Base {
    func goo() {}
}
class AAA<T> <: Base {
    func foo1() {}
    func foo2<U>() {}
}

main() {
    var a = AAA<Int64>()
    a.foo2<Base>()
    var b = AAA<Int32>()
    return 0
}

// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl3gooEv.* genericDecl: _CN7default3AAAIGTE3gooEv
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIi3gooEv.* genericDecl: _CN7default3AAAIGTE3gooEv
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl6<init>Hv.* genericDecl: _CN7default3AAAIGTE6<init>Hv
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIi6<init>Hv.* genericDecl: _CN7default3AAAIGTE6<init>Hv
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl4foo1Ev.* genericDecl: _CN7default3AAAIGTE4foo1Ev
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIi4foo1Ev.* genericDecl: _CN7default3AAAIGTE4foo1Ev
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl4foo2ICN7default4BaseEEv.* genericDecl: _CN7default3AAAIl4foo2IGUEEv
// (CJNATIVE) ASSERT: regex class @_CN7default3AAAIlE.* genericDecl: _CN7default3AAAIGTEE
// (CJNATIVE) ASSERT: regex class @_CN7default3AAAIiE.* genericDecl: _CN7default3AAAIGTEE
// (CJNATIVE) ASSERT: regex-not Func @_CN7default3AAAIl4foo2IGUEEv.* genericDecl: _CN7default3AAAIGTE4foo2IGUEEv
// (CJNATIVE) ASSERT: regex-not Func @_CN7default3AAAIi4foo2IGUEEv.* genericDecl: _CN7default3AAAIGTE4foo2IGUEEv

// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl3gooEv.* genericDecl: _ZN7default3AAAIGTE3gooEv
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIi3gooEv.* genericDecl: _ZN7default3AAAIGTE3gooEv
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl6<init>Ev.* genericDecl: _ZN7default3AAAIGTE6<init>Ev
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIi6<init>Ev.* genericDecl: _ZN7default3AAAIGTE6<init>Ev
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl4foo1Ev.* genericDecl: _ZN7default3AAAIGTE4foo1Ev
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIi4foo1Ev.* genericDecl: _ZN7default3AAAIGTE4foo1Ev
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl4foo2IC_ZN7default4BaseEEv.* genericDecl: _ZN7default3AAAIl4foo2IGUEEv
// (not CJNATIVE) ASSERT: regex class @_ZN7default3AAAIlE.* genericDecl: _ZN7default3AAAIGTEE
// (not CJNATIVE) ASSERT: regex class @_ZN7default3AAAIiE.* genericDecl: _ZN7default3AAAIGTEE
// (not CJNATIVE) ASSERT: regex-not Func @_ZN7default3AAAIl4foo2IGUEEv.* genericDecl: _ZN7default3AAAIGTE4foo2IGUEEv
// (not CJNATIVE) ASSERT: regex-not Func @_ZN7default3AAAIi4foo2IGUEEv.* genericDecl: _ZN7default3AAAIGTE4foo2IGUEEv

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
