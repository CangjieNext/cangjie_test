// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %compiler %cmp_opt %debugCHIROpt %enableO2 %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC: %run %run_opt %output %run_args

class Aoo {
    public static var b: Int32 = 2
    public static func moo4() {
        b;
        return 2
    }
    public func noo4() {
        var a = moo4
        return a
    }
}

main(): Int64 {
    var a = Aoo()
    if (a.noo4()() != 2) {
        return 4
    }
    return 0
}

// ASSERT: scan The Apply node in the line:24 and the column:9, was optimized by Function Inline
// ASSERT: scan [RLE] The usages of the result of Load at [18,16] have been replaced by the value at [17,9]
