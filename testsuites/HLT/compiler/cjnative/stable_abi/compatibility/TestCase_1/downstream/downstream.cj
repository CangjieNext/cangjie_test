/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package downstream

import upstream.*

main(): Unit {
    checker()
    let instance_Class_1 = Class_1()
    instance_Class_1.instanceMemberVariable_1
    instance_Class_1.instanceMemberVariable_1 = 1i64
    instance_Class_1.instanceMemberVariable_1
    instance_Class_1.instanceMemberVariable_10
    Class_1.staticMemberVariable_1
    Class_1.staticMemberVariable_1 = 1i64
    Class_1.staticMemberVariable_1
    Class_1.staticMemberVariable_10
    instance_Class_1.instanceMemberProperty1
    instance_Class_1.instanceMemberProperty10
    instance_Class_1.instanceMemberProperty10 = 1i64
    instance_Class_1.instanceMemberProperty10
    Class_1.staticMemberProperty1
    Class_1.staticMemberProperty10
    Class_1.staticMemberProperty10 = 1i64
    Class_1.staticMemberProperty10
    instance_Class_1.instanceMemberFunction_1()
    instance_Class_1.instanceMemberFunction_10(1i64, param1: 1i64, param2: 1i64)
    Class_1.staticMemberFunction_1()
    Class_1.staticMemberFunction_10(1i64, param1: 1i64, param2: 1i64)
    let instance_Class_2 = Class_2<Int64, Int64, Int64>()
    instance_Class_2.instanceMemberVariable_1
    instance_Class_2.instanceMemberVariable_1 = 1i64
    instance_Class_2.instanceMemberVariable_1
    instance_Class_2.instanceMemberVariable_10
    Class_2<Int64, Int64, Int64>.staticMemberVariable_1
    Class_2<Int64, Int64, Int64>.staticMemberVariable_1 = 1i64
    Class_2<Int64, Int64, Int64>.staticMemberVariable_1
    Class_2<Int64, Int64, Int64>.staticMemberVariable_10
    instance_Class_2.instanceMemberProperty1
    instance_Class_2.instanceMemberProperty10
    instance_Class_2.instanceMemberProperty10 = 1i64
    instance_Class_2.instanceMemberProperty10
    Class_2<Int64, Int64, Int64>.staticMemberProperty1
    Class_2<Int64, Int64, Int64>.staticMemberProperty10
    Class_2<Int64, Int64, Int64>.staticMemberProperty10 = 1i64
    Class_2<Int64, Int64, Int64>.staticMemberProperty10
    instance_Class_2.instanceMemberFunction_1()
    instance_Class_2.instanceMemberFunction_10(1i64, param1: 1i64, param2: 1i64)
    Class_2<Int64, Int64, Int64>.staticMemberFunction_1()
    Class_2<Int64, Int64, Int64>.staticMemberFunction_10(1i64, param1: 1i64, param2: 1i64)
}
