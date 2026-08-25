/*
 * 关系矩阵 16 | extend_member_to_interface
 * 候选来源：扩展自身定义的成员；覆盖方向：扩展成员 → 接口（扩展成员满足接口要求）。
 * 构造：接口 I 声明抽象 foo；class A 无直接 foo；extend A <: I 在扩展里提供 foo 满足接口。
 *       泛型约束 T <: I，实例化到 A 时按需查询选取扩展提供的实现满足接口要求。
 * 预期：trace=[A.foo(ext)]，-O0/-O2 一致；证明扩展成员满足接口要求被正确选取。
 */
// Level: 1
// Description:
// 关系矩阵 16_extend_member_to_interface | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm16

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit
}

class A {
}

extend A <: I {
    public func foo(): Unit {
        __trace.append("[A.foo(ext)]")
    }
}

func k<T>(a: T): Unit where T <: I {
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
