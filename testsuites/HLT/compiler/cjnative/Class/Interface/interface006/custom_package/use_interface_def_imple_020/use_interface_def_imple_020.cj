/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg1
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg1/a.cj -o pkg1.%middle
// EXEC: %compiler %cmp_opt %f pkg1.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkg1.*

main() {
    var s2: MyInterface = myStruct()
    var s3: myStruct = myStruct()

    if (s2.foo2(()) == () && s2.foo4() == 20 && s2.foo3() == "success" && s3.foo3() == "success" && s3.foo2(()) == () &&
        s3.x == 20) {
        return 0
    } else {
        return 1
    }
}
