// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f %dumpCHIRDebug
// EXEC: %cat default_CHIR/[0-9]*_AST_CHIR.chirtxt | compare %f
// ASSERT: scan func @_CAF7default2E11AKE: () -> Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&>
// ASSERT: scan func @_CAF7default2E11BHi: () -> Struct-_CNat5ArrayIG_E<Class-_CNat6ObjectE&>

enum E1 {
   @anno["A"] A 
   | @anno["B"] B(Int32)
}

@Annotation
class anno {
    let field1: String
    public const init(a: String) {
        field1 = a
    }
}
let obj: Any = E1.A
main() {
    0
}