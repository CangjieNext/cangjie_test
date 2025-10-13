// LEVEL: 0
// EXEC: %compiler %debugCHIROpt %cmp_opt %f %enableO2 -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output
// EXEC: %compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output
// testing unary/binary/field operation with global/fields

let a = "abf"
var b = "abc"

interface K {
    func ttt():String
}
extend Bool <: K {
    public func ttt(): String {
        return if (this) { "true" } else { "false" }
    }
}

main() {
    let c = "fdasg"
    var d = "hdgs"

    let k = if (a.size > 1) {
        " sjadka"
    } else {
        "hfdsakl"
    }
    return
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: scan-not core dumped


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
