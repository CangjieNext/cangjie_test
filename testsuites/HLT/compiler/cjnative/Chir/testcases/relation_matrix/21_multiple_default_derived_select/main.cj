/*
 * 关系矩阵 21 | multiple_default_derived_select
 * 候选来源：菱形继承下多条默认实现路径；覆盖方向：派生层默认优先于上层默认。
 * 构造：接口 I 提供 foo 默认实现；接口 J <: I 覆盖 foo（更派生层的默认）；
 *       class C <: J 不实现 foo。泛型实例化到 C 时按需查询选取更派生层的 J.foo，
 *       而非上层 I.foo（菱形/多默认派生选取）。
 * 预期：trace=[J.foo]，-O0/-O2 一致；派生层默认优先。
 */
// Level: 1
// Description:
// 关系矩阵 21_multiple_default_derived_select | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm21

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
