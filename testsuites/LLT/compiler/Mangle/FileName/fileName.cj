// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping --apc=1 %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal void @"_CN7defaultUfileName$12startAbilityHCNY0_11MainAbilityE"
// (CJNATIVE) ASSERT: scan define internal void @"_CN7defaultXCNY_11MainAbilityEUfileName$K_10onContinueHv"

class MainAbility {
    public MainAbility(let context: String) {}
}

// private function
private func startAbility(ability: MainAbility): String {
    return ability.context
}

// extend private function
extend MainAbility {
    private func onContinue(): String {
        "MainAbility ${this.context} onContinue."
    }
    public func abilityContinue(): Unit {
        println(onContinue())
    }
}

main() {
    var ab = MainAbility("myContext")
    println(startAbility(ab))
    ab.abilityContinue()
    0
}
