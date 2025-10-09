// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt %n.cj -o %output | compare %f
// (CJNATIVE) ASSERT: regex The annotation factory function of C in the line .* is \_CAF7default1CE
// (CJNATIVE) ASSERT: regex The annotation factory function of v in the line .* is \_CAF7default1C1vK_E
// (CJNATIVE) ASSERT: regex The annotation factory function of foo in the line .* is \_CAF7default1C3fooHi
// (not CJNATIVE) ASSERT: regex The annotation factory function of C in the line .* is \$Anno_ZN7default1CE
// (not CJNATIVE) ASSERT: regex The annotation factory function of v in the line .* is \$Anno_ZN7default1C1vE
// (not CJNATIVE) ASSERT: regex The annotation factory function of foo in the line .* is \$Anno_ZN7default1C3fooEi
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