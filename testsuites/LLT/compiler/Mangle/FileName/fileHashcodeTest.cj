// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping --apc=1 %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define internal void @_CN7defaultU00000002pKB4p12startAbilityHRNY0_9EntryTestE
// (CJNATIVE) ASSERT: scan define internal void @_CN7defaultXRNY_9EntryTestEU00000002pKB4pK_10onContinueHv

public struct EntryTest <: ToString {
    public EntryTest(let key: String, let value: String) {}
    private func testHashCode(): String {
        "key: ${this.key}, value: ${this.value}"
    }
    public func toString(): String {
        return testHashCode()
    }
}

// private function
private func startAbility(entry: EntryTest): String {
    return entry.toString()
}

// extend private function
extend EntryTest {
    private func onContinue(): Unit {
        println("EntryTest onContinue.")
    }
    public func entryContinue(): Unit {
        onContinue()
    }
}

main() {
    var et = EntryTest("root", "123456")
    println(startAbility(et))
    et.entryContinue()
    0
}
