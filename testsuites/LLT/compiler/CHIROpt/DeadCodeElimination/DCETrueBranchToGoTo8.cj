// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py "default_CHIR/[0-9]*_ConstantPropagation.chirtxt" "Func @_CN7default2SA3fooHv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// while(false && ...) branch folded; only runtime if(cond) Branch remains.
// ASSERT: scan srcCodeIdentifier: foo
// ASSERT: scan-1 Branch(
// ASSERT: scan Constant(false)
// ASSERT: scan Constant(73i)

var cond: Bool = true

public struct SA {
    public init() {}

    mut func foo(): Int64 {
        if (cond) {
            73
        } else {
            var i: Int = 0;
            while ((false) && i < 100) {
                i++;
            };
            Int64(13)
        }
    }
}

main() {
    var sa = SA()
    sa.foo()
    0
}
