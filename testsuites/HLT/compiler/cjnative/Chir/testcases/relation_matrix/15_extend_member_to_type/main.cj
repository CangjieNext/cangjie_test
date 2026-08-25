/*
 * 关系矩阵 15 | extend_member_to_type
 * 候选来源：扩展自身定义的成员；覆盖方向：扩展成员 → 类型（类型无直接成员，沿用扩展成员）。
 * 构造：class A 无 foo；extend A 在扩展里定义 foo（不引入接口）。泛型函数约束 T <: A，
 *       实例化到 A 时调用 a.foo() 命中扩展定义的实现。
 * 预期：trace=[A.foo(ext)]，-O0/-O2 一致；证明扩展自身成员可被按需查询命中。
 * 注：此条不涉及接口约束，验证扩展成员的直接定位。
 */
// Level: 1
// Description:
// 关系矩阵 15_extend_member_to_type | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm15

import std.collection.*

var __trace: StringBuilder = StringBuilder()

class A {
}

extend A {
    public func foo(): Unit {
        __trace.append("[A.foo(ext)]")
    }
}

func k<T>(a: T): Unit where T <: A {
    a.foo()
}

main(): Unit {
    k<A>(A())
    if (__trace.toString() == "[A.foo(ext)]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
