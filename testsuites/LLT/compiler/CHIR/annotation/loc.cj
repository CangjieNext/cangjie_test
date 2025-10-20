// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %f %dumpCHIRDebug
// (DEBUG_OPTION)EXEC: %cat default_CHIR_Debug/0_AST_CHIR.chir | compare %f

@Annotation
public class Anno {
    public const init() {}
}

@Anno
const func foo() {}

@!Anno
var a = 23

main() {}

// (CJNATIVE) ASSERT: scan [compilerAdd] Func @_CAF7default3fooHv() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "loc.cj"
// (CJNATIVE) ASSERT: scan [compilerAdd] Func @_CAF7default1aE() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "loc.cj"
// (not CJNATIVE) ASSERT: scan Func @$Anno_ZN7default3fooEv() : () -> RawArray<Class-_ZN8std.core6ObjectE&> // kind: annoFactory, loc: "loc.cj"
// (not CJNATIVE) ASSERT: scan Func @$Anno_ZN7default1aE() : () -> RawArray<Class-_ZN8std.core6ObjectE&> // kind: annoFactory, loc: "loc.cj"
