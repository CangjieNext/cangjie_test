// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping --apc=1 %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define i1 @_CN7default20onPrepareToTerminateHRNat6StringE

public func onPrepareToTerminate(kill: String): Bool {
    if (kill == "kill") {
        return true
    } else {
        return false
    }
}

main() {
    println(onPrepareToTerminate("kill"))
    0
}
