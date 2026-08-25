/*
 * 关系矩阵 06 | interface_abstract_to_extend
 * 候选来源：接口声明抽象成员；覆盖方向：接口抽象 → extend（扩展提供实现）。
 * 构造：接口 I 声明抽象 foo；struct S 无直接实现；extend S <: I 在扩展里提供 foo。
 *       泛型实例化到 S 时按需查询选取扩展提供的实现。
 * 预期：trace=[S.foo(ext)]，-O0/-O2 一致；证明扩展实现可被按需查询命中。
 */
// Level: 1
// Description:
// 关系矩阵 06_interface_abstract_to_extend | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm06

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit
}

struct S {
    public let v: Int64
    public init(v: Int64) { this.v = v }
}

extend S <: I {
    public func foo(): Unit {
        __trace.append("[S.foo(ext)]")
    }
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}

main(): Unit {
    k<S>(S(0i64))
    if (__trace.toString() == "[S.foo(ext)]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
