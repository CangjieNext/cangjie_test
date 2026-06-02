// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug
// EXEC: %cat default_CHIR/[0-9]*_AST_CHIR.chirtxt | compare %f

@Annotation
public class Ann1 {
    let name: String

    const init(name: String) {
        this.name = name
    }
}

@Annotation
public class Ann2 {
    let i: Int32

    const init(i: Int32) {
        this.i = i
    }
}

@Ann1["Class"]
class C {
    @Ann1["Var"]
    private let v = 0

    @Ann1["Method"]
    @Ann2[1]
    public func foo(i: Int32): Unit {}
}

main() {
    0
}

// ASSERT: regex \[static\] \[compileTimeVal\] \[compilerAdd\] Func @_CAF7default1CE\(\): Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // loc: "testAnno06.cj"-29-1, .*kind: annoFactory
// ASSERT: regex \[static\] \[compileTimeVal\] \[compilerAdd\] Func @_CAF7default1C1vK_E\(\): Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // loc: "testAnno06.cj"-31-5, .*kind: annoFactory
// ASSERT: regex \[static\] \[compileTimeVal\] \[compilerAdd\] Func @_CAF7default1C3fooHi\(\): Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // loc: "testAnno06.cj"-34-5, .*kind: annoFactory