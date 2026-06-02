// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC:%compiler %debugCHIROpt %cmp_opt %enableO2 %f -o %output 2>&1 | compare %f

func foo() {
    1 << 1
}

func a(f: (Int64, Int64, Int64), mono: Int64) {
    let mono_ = UInt64(mono)
    let dur = f[2]
    if (dur <= 0 && mono_ > UInt64(-(dur + 1))) {
        print(dur)
    }
    if (dur > 0 && UInt64(0x7fffffffffffffff) - mono_ > UInt64(dur)) {
        print(mono)
    }
}

main() {
    a((foo(), 3, foo()), foo())
    return
}

// ASSERT: regex-not Assertion .* failed
// ASSERT: regex-not core dumped
