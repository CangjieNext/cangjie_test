// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f

// ASSERT: regex-not store %record._CN7default2RAE zeroinitializer
// ASSERT: regex-not store %Unit.Type zeroinitializer

// (not CJNATIVE) ASSERT: regex-not memset

class CA {}

struct RA {
    var a = 1
    var b = 2
    var c = 3
    var d = 4
    var e = CA()
}

func foo(x: RA, y: RA) {}

main() {
    let t = (6, unsafe { zeroValue<Unit>() })
    let a = unsafe { zeroValue<Int64>() }
    let b = unsafe { zeroValue<RA>() }
    let ccc = (6, unsafe { zeroValue<RA>() })
    foo(unsafe { zeroValue<RA>() }, unsafe { zeroValue<RA>() })
    0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
