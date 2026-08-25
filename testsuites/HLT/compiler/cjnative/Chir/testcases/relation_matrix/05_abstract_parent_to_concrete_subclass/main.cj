/*
 * 关系矩阵 05 | abstract_parent_to_concrete_subclass
 * 候选来源：抽象父类声明的抽象方法；覆盖方向：抽象父类 → 具体子类（实现）。
 * 构造：abstract class A 声明抽象 foo；class B <: A 实现 foo。泛型上界 T <: A，
 *       实例化到 B 时按需查询穿透抽象父类选取 B.foo。
 * 预期：trace=[B.foo]，-O0/-O2 一致；不完整子类（不实现 foo）被拒绝（见 negative_part.cj）。
 */
// Level: 1
// Description:
// 关系矩阵 05_abstract_parent_to_concrete_subclass | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm05

import std.collection.*

var __trace: StringBuilder = StringBuilder()

abstract class A {
    public func foo(): Unit
}

class B <: A {
    public override func foo(): Unit {
        __trace.append("[B.foo]")
    }
}

func k<T>(a: T): Unit where T <: A {
    a.foo()
}

main(): Unit {
    k<B>(B())
    if (__trace.toString() == "[B.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
