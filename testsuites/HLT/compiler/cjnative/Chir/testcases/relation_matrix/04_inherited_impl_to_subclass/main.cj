/*
 * 关系矩阵 04 | inherited_impl_to_subclass
 * 候选来源：父类已实现的成员；覆盖方向：继承实现 → 子类（不覆盖，沿用父类）。
 * 构造：class P <: I 实现 foo；class S <: P 不覆盖 foo。泛型实例化到 S 时
 *       按需查询选取继承自父类的 P.foo。
 * 预期：trace=[P.foo]，-O0/-O2 一致；证明继承链上的实现可被按需查询命中。
 */
// Level: 1
// Description:
// 关系矩阵 04_inherited_impl_to_subclass | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm04

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit
}

open class P <: I {
    public func foo(): Unit {
        __trace.append("[P.foo]")
    }
}

class S <: P {
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}

main(): Unit {
    k<S>(S())
    if (__trace.toString() == "[P.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
