/*
 * 关系矩阵 01 | interface_abstract_to_class
 * 候选来源：接口声明抽象成员；覆盖方向：接口 → class（class 提供实现）。
 * 构造：接口 I 声明抽象 foo，class C <: I 实现 foo。泛型函数约束 T <: I，
 *       实例化到 C 时按需查询选取 C.foo（类型自身实现覆盖接口抽象）。
 * 预期：trace=[C.foo]，-O0/-O2 一致；交换 I/C 声明顺序结果不变。
 */
// Level: 1
// Description:
// 关系矩阵 01_interface_abstract_to_class | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm01

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
