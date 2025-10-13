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

    if (son_tc.exported_prop2 == 1
        && tc.prop1 == 1 && tc._prop3 == 3
        && tc.prop4 == 4 && tc.prop6 == 6
        && tc.prop10 == 10 && tc.prop11 == 11
        && tc.a == -1) {
        return 0
    } else {
        return 1
    }
}
