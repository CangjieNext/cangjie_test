/*
 * 关系矩阵 13 | class_to_extend_interface
 * 候选来源：类型自身成员 + 扩展引入接口默认；覆盖方向：类型自身覆盖扩展引入的接口默认。
 * 构造：class A 自身定义 foo；接口 I 提供 foo 默认实现；extend A <: I 引入接口。
 *       泛型实例化到 A 时按需查询优先选取类型自身 A.foo，而非扩展引入的接口默认 I.foo。
 * 预期：trace=[A.foo]，-O0/-O2 一致；类型自身优先于扩展引入的接口默认。
 */
// Level: 1
// Description:
// 关系矩阵 13_class_to_extend_interface | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm13

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit {
        __trace.append("[I.foo]")
    }
}

class A {
    public func foo(): Unit {
        __trace.append("[A.foo]")
    }
}

extend A <: I {
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}

main(): Unit {
    k<A>(A())
    if (__trace.toString() == "[A.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
