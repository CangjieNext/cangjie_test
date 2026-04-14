// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f %dumpCHIRDebug
// EXEC: %cat default_CHIR/[0-9]*_AST_CHIR.chirtxt | compare %f

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
