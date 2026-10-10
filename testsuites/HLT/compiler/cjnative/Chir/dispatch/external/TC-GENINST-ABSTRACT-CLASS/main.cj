/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-ABSTRACT-CLASS | 抽象类作为泛型上界的实例化选型（正向侧）
 * 需求 design-spec §3(abstract class 延迟实现)/§7:abstract_parent_to_concrete_subclass。
 * 覆盖六步②父类在抽象类上界场景下的延迟实现路径。
 *
 * 构造：抽象类 Animal 声明抽象方法 sound，作为泛型上界 T <: Animal。
 * 具体子类 Dog 实现 sound，实例化到 Dog 时按需查询重排选取 Dog.sound。
 * 不完整子类（未实现抽象方法）的拒绝形态见同目录 negative_part.cj（预期编译失败）。
 *
 * 本文件为正向 fixture：Dog 合法选取，-O0/-O2 双跑断言 TRACE_OK。
 */
// Level: 1
// Description:
// TC-GENINST-ABSTRACT-CLASS | 抽象类作为泛型上界实例化选型(正向侧),Dog 合法选取 sound。
// 预期 -O0/-O2 双跑编译链接运行成功,cjc --test 报 PASSED:1 FAILED:0,stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package packageA

import std.collection.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

var __trace: StringBuilder = StringBuilder()

abstract class Animal {
    // 抽象方法：强制子类实现，不完整子类会被拒绝（见 negative_part.cj）。
    public func sound(): Int64
}

// 具体子类 override，实例化命中此处。
class Dog <: Animal {
    public override func sound(): Int64 {
        __trace.append("[Dog.sound]")
        1i64
    }
}

// 泛型上界 T <: Animal，实例化到 Dog 时按需查询重排选取 Dog.sound。
func g<T>(a: T): Int64 where T <: Animal {
    a.sound()
}


@Test
class GeninstAbstractClassTest {
    @TestCase
    func traceCheck(): Unit {

    let d: Animal = Dog()
    // 多态调用走 Dog.sound。
    let poly = d.sound()
    // 泛型实例化调用同样命中 Dog.sound。
    let inst = g<Dog>(Dog())
        @Expect(poly, 1i64)
        @Expect(inst, 1i64)
        @Expect(__trace.toString(), "[Dog.sound][Dog.sound]")
    }
}
