/*
 * 关系矩阵 09 | parent_interface_default_to_child_interface
 * 候选来源：父接口提供默认实现；覆盖方向：父接口默认 → 子接口（子接口覆盖默认）。
 * 构造：接口 I 提供 foo 默认实现；子接口 J <: I 覆盖 foo（新默认）；class C <: J 不实现 foo。
 *       泛型实例化到 C 时按需查询选取子接口覆盖的 J.foo，而非父接口默认 I.foo。
 * 预期：trace=[J.foo]，-O0/-O2 一致；证明子接口默认覆盖父接口默认。
 */
// Level: 1
// Description:
// 关系矩阵 09_parent_interface_default_to_child_interface | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm09

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit {
        __trace.append("[I.foo]")
    }
}

interface J <: I {
    func foo(): Unit {
        __trace.append("[J.foo]")
    }
}

class C <: J {
}

func k<T>(a: T): Unit where T <: I {
    a.foo()
}

main(): Unit {
    k<C>(C())
    if (__trace.toString() == "[J.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
