/*
 * 关系矩阵 12 | class_to_interface
 * 候选来源：类型自身成员；覆盖方向：class → interface（class 成员实现接口要求）。
 * 构造：接口 I 声明抽象 foo；class C 自身定义 foo 满足接口要求 C <: I。
 *       泛型实例化到 C 时按需查询选取类型自身 C.foo 作为接口实现。
 * 预期：trace=[C.foo]，-O0/-O2 一致；类型自身优先。
 */
// Level: 1
// Description:
// 关系矩阵 12_class_to_interface | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm12

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit
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
