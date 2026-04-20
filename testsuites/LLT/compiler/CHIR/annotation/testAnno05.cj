// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug
// EXEC: %cat default_CHIR/[0-9]*_AST_CHIR.chirtxt | compare %f

@Annotation
public class Anno1 {
    public const init() {}
}

@Annotation
public class Anno2 {
    public const init() {}
}

@Anno1
@Anno2
class A {}

class B {
    @Anno1
    @Anno2
    public init() {}
}

main() {
    0
}

// ASSERT: regex \[static\] \[compileTimeVal\] \[compilerAdd\] Func @_CAF7default1AE\(\): Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // loc: "testAnno05.cj"-21-1, .*kind: annoFactory
// ASSERT: regex \[static\] \[compileTimeVal\] \[compilerAdd\] Func @_CAF7default1B6<init>Hv\(\): Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // loc: "testAnno05.cj"-26-5, .*kind: annoFactory