/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
 * TC-GENINST-ABSTRACT-CLASS | 抽象类上界的不完整子类（负向侧）
 * 需求 design-spec §3/§7:不完整子类被拒绝。
 *
 * 构造：抽象类 Animal 声明抽象方法 sound，具体子类 Cat 继承但不实现 sound。
 * 由于 sound 是抽象方法且 Cat 非抽象类，编译期被拒绝。
 * 本文件预期编译失败，不得作为 runtime trace 用例。
 * 预期 DiagKind=sema_class_need_abstract_modifier_or_func_need_impl（与 NEG_abstract_unimpl 同族）。
 */
// Level: 1
// Description:
// TC-GENINST-ABSTRACT-CLASS | 不完整子类(负向侧),Cat 非抽象但未实现抽象方法 sound 被拒绝。
// 负向用例:预期编译失败,不得作为 runtime trace 用例。
// 通过 --diagnostic-format=json 取符号化 DiagKind,断言命中 sema_class_need_abstract_modifier_or_func_need_impl。
// EXEC-PIPE-1: %compiler %cmp_opt %f --diagnostic-format=json -o %output 2>&1 | compare %f
// ASSERT: scan sema_class_need_abstract_modifier_or_func_need_impl

package packageA

abstract class Animal {
    public func sound(): Int64
}

// 不完整子类：继承抽象方法但未实现，且自身非 abstract，编译期拒绝。
class Cat <: Animal {
}

main(): Unit {
    let c: Animal = Cat()
    println(c.sound())
}
