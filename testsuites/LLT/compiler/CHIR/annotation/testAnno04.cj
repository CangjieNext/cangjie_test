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
public enum Weekday1 {
    | @Anno A
    | @Anno B(Int32)
}

main() {
    0
}

// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default8Weekday1E() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno04.cj"-16-1
// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default8Weekday11AKE() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno04.cj"-18-7
// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default8Weekday11BHi() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno04.cj"-19-7