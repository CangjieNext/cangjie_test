/*
 * 关系矩阵 02 | interface_default_to_class
 * 候选来源：接口提供默认实现；覆盖方向：接口默认 → class（class 覆盖默认）。
 * 构造：接口 I 提供 foo 默认实现，class C <: I 覆盖 foo。泛型实例化到 C 时
 *       按需查询优先选取类型自身实现 C.foo，而非接口默认 I.foo。
 * 预期：trace=[C.foo]，-O0/-O2 一致；声明顺序无关。
 */
// Level: 1
// Description:
// 关系矩阵 02_interface_default_to_class | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm02

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit {
        __trace.append("[I.foo]")
    }
}

class C <: I {
    public func foo(): Unit {
        __trace.append("[C.foo]")
    }
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}

main(): Unit {
    k<C>(C())
    if (__trace.toString() == "[C.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
