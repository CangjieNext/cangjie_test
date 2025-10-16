// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt %n.cj -o %output | compare %f
// (CJNATIVE) ASSERT: regex The annotation factory function of A in the line .* is \_CAF7default1AE
// (CJNATIVE) ASSERT: regex The annotation factory function of init in the line .* is \_CAF7default1B6<init>Hv
// (not CJNATIVE) ASSERT: regex The annotation factory function of A in the line .* is \$Anno_ZN7default1AE
// (not CJNATIVE) ASSERT: regex The annotation factory function of init in the line .* is \$Anno_ZN7default1B6<init>Ev
@Annotation
public class Anno1 {
    public const init() {}
}

@Annotation
public class Anno2 {
    public const init() {}
}

@Anno1
@Anno2
class A {}

class B {
    @Anno1
    @Anno2
    public init() {}
}

main() {
    0
}