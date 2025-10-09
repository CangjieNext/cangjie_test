// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION) EXEC: %compiler %cmp_opt %debugCHIROpt %n.cj -o %output | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of IA in the line .* is \_CAF7default2IAE
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of IB in the line .* is \_CAF7default2IBE
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of sayHi in the line .* is \_CAF7default2IB5sayHiHv
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is \_CAF7default2IB4setAHlE1aE
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of \$aget in the line .* is \_CAF7default2IB1aE

// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of IA in the line .* is \$Anno_ZN7default2IAE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of IB in the line .* is \$Anno_ZN7default2IBE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of sayHi in the line .* is \$Anno_ZN7default2IB5sayHiEv
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of a in the line .* is \$Anno_ZN7default2IB4setA1aS9a0c0a0b0bE
// (not CJNATIVE and DEBUG_OPTION) ASSERT: regex The annotation factory function of \$aget in the line .* is \$Anno_ZN7default2IB1aE

@Annotation
public class Anno {
    public const init() {}
}

@Anno
public interface IA {}

@Anno
public interface IB {
    @Anno
    func sayHi(): Unit

    func setA(@Anno a: Int64): Unit

    @Anno
    prop a: Int64
}

main() {
    0
}