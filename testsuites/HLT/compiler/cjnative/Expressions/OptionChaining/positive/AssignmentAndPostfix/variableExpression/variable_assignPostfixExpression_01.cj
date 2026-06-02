/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
class A {
    var b = Some(B())
}

class B {
    var c: Int64 = 0
}

main() {
    var a = Some(A())
    a?.b?.c = 1
    var res = a?.b?.c ?? -1
    if (res != 1) {
        return 1
    }
    return 0
}
