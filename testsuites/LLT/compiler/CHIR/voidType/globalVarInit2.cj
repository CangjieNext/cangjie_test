// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj %dumpCHIRDebug | true
// EXEC: %cat default_CHIR/[0-9]*_ClosureConversion.chirtxt | compare %n.cj
// ASSERT: scan Func @_CAO7default1BEK_iiHv() : Void
// ASSERT: scan Void = Apply(@_CAO7default1BEK_iiHv)

const func myTarget(x: Int64) {
    match(x) {
        case 0 => x
        case 1 => x
        case 2 => x
        case 3 => x
        case 4 => x
        case _ => Type
    }
}
@Annotation[target:[(MemberVariable, myTarget(2))[0]]]
public class A {
    const init() {
    }
}
@A
class B {
}
main() {
}