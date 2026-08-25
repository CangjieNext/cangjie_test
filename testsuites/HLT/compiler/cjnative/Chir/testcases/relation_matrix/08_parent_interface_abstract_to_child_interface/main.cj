/*
 * 关系矩阵 08 | parent_interface_abstract_to_child_interface
 * 候选来源：父接口声明抽象成员；覆盖方向：父接口抽象 → 子接口（子接口可声明但未实现）。
 * 构造：接口 I 声明抽象 foo；子接口 J <: I 重新声明 foo（仍抽象）；class C <: J 实现 foo。
 *       泛型实例化到 C 时按需查询穿透两层接口选取 C.foo。
 * 预期：trace=[C.foo]，-O0/-O2 一致；证明子接口重新声明不阻断按需查询。
 */
// Level: 1
// Description:
// 关系矩阵 08_parent_interface_abstract_to_child_interface | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm08

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Unit
}

interface J <: I {
    func foo(): Unit
}

class C <: J {
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
