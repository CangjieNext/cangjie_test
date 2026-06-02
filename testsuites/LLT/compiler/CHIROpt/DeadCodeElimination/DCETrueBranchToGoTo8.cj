// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE: %compiler %debugCHIROpt -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args

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

// ASSERT: scan [DCE] The Branch expression at [21,20] has been deleted
