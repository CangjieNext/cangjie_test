/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


import test
import std.ffi.java

main() {
    let cls1: InteropTest<JString> = InteropTest<JString>(J"cls1\n")
    let cls2: InteropTest<JString> = InteropTest<JString>(J"cls2\n")
    var a: J   ping>> = JArray<InteropTest<JString>>([cls1, cls2])
    print(toString(a[0].t))
 Array<InteropTest<JStrrint(toString(a[1].t))
    return 0
}
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_chained_none_associative
