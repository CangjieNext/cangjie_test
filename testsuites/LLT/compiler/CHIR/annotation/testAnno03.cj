// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION) EXEC: %compiler %cmp_opt %debugCHIROpt %n.cj -o %output | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of SA in the line .* is \_CAF7default2SAE
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of SC in the line .* is \_CAF7default2SCE
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is \_CAF7default2SC1aK_E
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of sayHi in the line .* is \_CAF7default2SC5sayHiHv
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is \_CAF7default2SC4setAHlE1aE
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of \$bget in the line .* is \_CAF7default2SC1bE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of SA in the line .* is \$Anno_ZN7default2SAE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of SC in the line .* is \$Anno_ZN7default2SCE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is \$Anno_ZN7default2SC1aE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of sayHi in the line .* is \$Anno_ZN7default2SC5sayHiEv
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is \$Anno_ZN7default2SC4setA1aS9a0c0a0b0bE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of \$bget in the line .* is \$Anno_ZN7default2SC1bE

@Annotation
public class Anno {
    public const init() {}
}

@Anno
public struct SA {}

@Anno
public struct SC {
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