// LEVEL: 0
// EXEC: %compiler %dumpCHIRDebug %cmp_opt %f -o %output
// (not Windows)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/0\_AST\_CHIR.chirtxt | compare %f

class AAA<T> {
    func foo2<U>() {}
}

main() {
    var a = AAA<Int64>()
    var b = AAA<Int32>()
    a.foo2<Int64>()
    return 0
}

// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl4foo2IlEv.* genericDecl: _CN7default3AAAIl4foo2IGUEEv
// (CJNATIVE) ASSERT: regex-not Func @_CN7default3AAAIl4foo2IGUEEv.* genericDecl: _CN7default3AAAIGTE4foo2IGUEEv
// (CJNATIVE) ASSERT: regex-not Func @_CN7default3AAAIi4foo2IGUEEv.* genericDecl: _CN7default3AAAIGTE4foo2IGUEEv

// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl4foo2IlEv.* genericDecl: _ZN7default3AAAIl4foo2IGUEEv
// (not CJNATIVE) ASSERT: regex-not Func @_ZN7default3AAAIl4foo2IGUEEv.* genericDecl: _ZN7default3AAAIGTE4foo2IGUEEv
// (not CJNATIVE) ASSERT: regex-not Func @_ZN7default3AAAIi4foo2IGUEEv.* genericDecl: _ZN7default3AAAIGTE4foo2IGUEEv

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
