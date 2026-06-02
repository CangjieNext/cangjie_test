/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (!(target_mac | target_ios | target_ios_simulator)) EXEC: %compiler %cmp_opt %f -o %output
// (!(target_mac | target_ios | target_ios_simulator)) RUN-EXEC-PIPE: %run %run_opt %output %run_args
// 当 newValue 是 interface 子类型的情况。
import std.reflect.*

public interface I0 {}

public class C0 <: I0 {}

public open class C2 {
    public var a: I0 = C0()
}

main(): Unit {
    let c2 = C2()
    TypeInfo.of(c2).getInstanceVariable("a").setValue(c2, C0())
}
