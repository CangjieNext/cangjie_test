/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import test_stable_abi.*

public class Son_TestClass <: TestClass {
    public prop exported_prop2: Int64 {
        get() {
            exported_prop1
        }
    }
}

main() {
    let son_tc = Son_TestClass()
    let tc = TestClass()
    tc.prop6 = 6
    tc.prop10 = 12345
    tc.prop11 = -1

    assert(son_tc.exported_prop2 , 1)
    assert(tc.prop1 , 1)
    assert(tc._prop3 , 3)
    assert(tc.prop4 , 4)
    assert(tc.prop6 , 6)
    assert(tc.prop10 , 10)
    assert(tc.prop11 , 11)
    assert(tc.prop13 , 13)
    assert(tc.prop14 , 14)
    assert(tc.prop12 , 12)
    assert(tc.a , -1)
    checker(tc)
}
