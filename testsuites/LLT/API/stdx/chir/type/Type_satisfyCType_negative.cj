/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// 反向用例：不应视为 C 可映射类型的 satisfyCType（期望多为 false）

/* SCAN
tuple satisfyC: false
enum satisfyC: false
class satisfyC: false
generic param satisfyC: false
nothing satisfyC: false
box i32 satisfyC: false
ref i32 satisfyC: false
this satisfyC: false
rune satisfyC: true
func plain satisfyC: false
*/

import stdx.chir.*

main() {
    let pkg = Package("pkg.sat.neg", AccessLevel.Public)
    let i32 = IntType.getInt32()

    let tup = TupleType.get(Array<Type>(1, { _ => i32 }))
    println("tuple satisfyC: ${tup.satisfyCType()}")

    let en = pkg.addEnum("mNegE", "NegE", true)
    println("enum satisfyC: ${EnumType.get(en, Array<Type>()).satisfyCType()}")

    let cls = pkg.addClass("mNegC", "NegC", true)
    println("class satisfyC: ${ClassLikeType.get(cls, Array<Type>()).satisfyCType()}")

    let g = GenericType.get("gNeg", "T")
    println("generic param satisfyC: ${g.satisfyCType()}")

    println("nothing satisfyC: ${NothingType.get().satisfyCType()}")
    println("box i32 satisfyC: ${BoxType.get(i32).satisfyCType()}")
    println("ref i32 satisfyC: ${RefType.get(i32).satisfyCType()}")
    println("this satisfyC: ${ThisType.get().satisfyCType()}")
    println("rune satisfyC: ${RuneType.get().satisfyCType()}")

    let plainFn = FuncType.get(Array<Type>(1, { _ => i32 }), i32)
    println("func plain satisfyC: ${plainFn.satisfyCType()}")
}
