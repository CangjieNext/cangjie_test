// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct S1 {
    var d = 5
    var a = Option<S1>.None
    var b = 5
}

class S2 {
    var d = 5
    var a = Option<S2>.None
    var b = 5
}

main() {
    /*
     * the final output of s1 and s2 should be:
     *    (S1) $d+ = {
     *        d = 5
     *        a = {
     *            val = 0x0000xxxx
     *        }
     *        b = 5
     *    }
     *    (S2) $d+ = {
     *        d = 5
     *        a = nil/0x0000xxxx
     *        b = 5
     *    }
     */
    var s1 = S1()
    var val1 = Option.Some(s1)
    var s2 = S2()
    var val2 = Option.Some(s2)
    s1.a = val1
    s2.a = val2
    0
}
