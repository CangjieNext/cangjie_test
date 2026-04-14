// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f %dumpCHIRDebug
// EXEC: %cat default_CHIR/[0-9]*_AST_CHIR.chirtxt | compare %f

@Annotation
public class A1 {
    public let v: Int64
    public const init(p0: Int64) {
        this.v = p0
    }
}

public class C0 {
    @A1[12]
    public static var v123: Int64 = 12
}

main() {
    0
}

// ASSERT: scan [static] [compileTimeVal] [compilerAdd] Func @_CAF7default2C04v123E() : Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&> // kind: annoFactory, loc: "testAnno07.cj"-20-5