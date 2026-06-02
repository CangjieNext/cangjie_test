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

// ASSERT: regex \[compilerAdd\] Func @_CAF7default3fooHv\(\): Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // loc: "loc.cj"-16-1, .*kind: annoFactory
// ASSERT: regex \[compilerAdd\] Func @_CAF7default1aE\(\): Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // loc: "loc.cj"-19-1, .*kind: annoFactory

// ASSERT: regex-begin @AnnoFactoryFunc: _CAF7default1aE
// ASSERT: regex-next @Anno // loc: "loc.cj"-19-1, .*
// ASSERT: regex-next .*@_CN7default1aE: Int64& = 23i // loc: "loc.cj"-20-1, .*

// ASSERT: regex-begin @AnnoFactoryFunc: _CAF7default3fooHv
// ASSERT: regex-next @Anno // loc: "loc.cj"-16-1, .*
// ASSERT: regex-next .*Func @_CN7default3fooHv\(\): Unit // loc: "loc.cj"-17-1, .*