// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and DEBUG_OPTION) DEPENDENCE: test2.cj
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %f test2.cj 2>&1 | compare %f
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex-auto @"_CN1AUtest1$3fooE"
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex-auto @"_CN1AUtest2$3fooE"
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex-auto i64 @"_CN1AUtest1$3gooHv"
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex-auto i64 @"_CN1AXCN1A2AAEUtest2$K_3cooHv"
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex-auto i64 @"_CN1AXCN1A2AAEUtest1$K_3cooHv"
// (CJNATIVE and DEBUG_OPTION) ASSERT: regex-auto i64 @"_CN1AXCN1A2AAEUtest1$K0_3cooHv"
package A

private func goo() {
    return 3
}

private var foo = 3

class AA {
    func koo() {
        return 1;
    }
}

extend AA {
    private func coo() {
        return 1
    }
    func doo() {
        return coo()
    }
}

extend AA {
    private func coo() {
        return 1
    }
    func eoo() {
        return coo()
    }
}

main() {
    var a = AA();

    return goo() - foo - a.koo() + a.eoo();
}
