// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug
// EXEC: %cat default_CHIR/[0-9]*_AST_CHIR.chirtxt | compare %f

@Annotation
public class Anno {
    public const init() {}
}

@Anno
public class CA {}

@Anno
public class CB {
    @Anno
    var a = 0

    @Anno
    func sayHi(): Unit {}

    func setA(@Anno a: Int64): Unit {}

    @Anno
    prop b: Int64 {
        get() {
            print("get")
            a
        }
    }
}

main() {
    0
}

// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default2CAE() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno02.cj"-16-1
// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default2CBE() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno02.cj"-19-1
// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default2CB1aK_E() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno02.cj"-21-5
// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default2CB5sayHiHv() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno02.cj"-24-5
// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default2CB4setAHlE1aE() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno02.cj"-27-15
// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default2CB1bE() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno02.cj"-29-5