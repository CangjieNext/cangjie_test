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

public interface I1 {
    func f() {
        return 1
    }
}

public interface I2 <: I1 {
    func f() {
        return 2
    }
}

public interface I3 <: I2 {
    func f() {
        return 3
    }
}

public open class C1 <: I3 {}

main(): Int64 {
    var obj: C1 = C1()
    if (obj.f() != 3) {
        return 1
    }
    return 0
}
