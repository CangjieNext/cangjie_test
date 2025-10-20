// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION) EXEC: %compiler %cmp_opt %debugCHIROpt %n.cj -o %output | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of CA in the line .* is _CAF7default2CAE
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of CB in the line .* is _CAF7default2CBE
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is _CAF7default2CB1aK_E
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of sayHi in the line .* is _CAF7default2CB5sayHiHv
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is _CAF7default2CB4setAHlE1aE
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of \$bget in the line .* is _CAF7default2CB1bE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of CA in the line .* is \$Anno_ZN7default2CAE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of CB in the line .* is \$Anno_ZN7default2CBE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is \$Anno_ZN7default2CB1aE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of sayHi in the line .* is \$Anno_ZN7default2CB5sayHiEv
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is \$Anno_ZN7default2CB4setA1aS9a0c0a0b0bE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of \$bget in the line .* is \$Anno_ZN7default2CB1bE

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