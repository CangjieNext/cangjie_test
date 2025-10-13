// LEVEL: 0
// EXEC: %compiler %dumpCHIRDebug %cmp_opt %f -o %output
// (not Windows)EXEC-PIPE-0: %cat %n\_CHIR\_Debug/0\_AST\_CHIR.chirtxt | compare %f

enum AAA<T> {
    RED | GREEN(T)  // 暂时还没需求找GREEN的泛型声明版本
    func foo() {}   // CHIR中有多个实例化版本
}

main() {
    var a = AAA<Int64>.RED
    var b = AAA<Int32>.RED
    return 0
}

// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIl3fooEv.* genericDecl: _CN7default3AAAIGTE3fooEv
// (CJNATIVE) ASSERT: regex Func @_CN7default3AAAIi3fooEv.* genericDecl: _CN7default3AAAIGTE3fooEv
// (CJNATIVE) ASSERT: regex enum @_CN7default3AAAIlE.* genericDecl: _CN7default3AAAIGTEE
// (CJNATIVE) ASSERT: regex enum @_CN7default3AAAIiE.* genericDecl: _CN7default3AAAIGTEE

// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIl3fooEv.* genericDecl: _ZN7default3AAAIGTE3fooEv
// (not CJNATIVE) ASSERT: regex Func @_ZN7default3AAAIi3fooEv.* genericDecl: _ZN7default3AAAIGTE3fooEv
// (not CJNATIVE) ASSERT: regex enum @_ZN7default3AAAIlE.* genericDecl: _ZN7default3AAAIGTEE
// (not CJNATIVE) ASSERT: regex enum @_ZN7default3AAAIiE.* genericDecl: _ZN7default3AAAIGTEE

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
