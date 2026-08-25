/*
 * TC-GENINST-843-O2 | issue#843 -O2 无 undefined symbol
 * 需求 design-spec §1: -O2 抽象方法实例化为 undefined symbol 链接错误修复点
 *   (GetInstantiatedTarget 空回退 instDecl ? instDecl : decl)。
 * 构造: 跨接口继承 I<:I_Buddy + extend C<:I + 泛型函数 test<M> where M<:I_Buddy。
 * 手写落地(已验证 -O2 TRACE_OK,0 undefined symbol)。
 */
// Level: 1
// Description:
// 六步种子 GENINST_issue843 | 泛型实例化按需选型正向。父接口默认/子覆盖/六步选取,实例化命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I_Buddy {
    func foo_Buddy(): Int64

    func boo_Buddy(): Int64
}

interface I <: I_Buddy {
    func foo_Buddy(): Int64 {
        __trace.append("[I.foo_Buddy]")
        1i64
    }

    func boo_Buddy(): Int64 {
        __trace.append("[I.boo_Buddy]")
        1i64
    }
}

class C {}

extend C <: I {
    public func foo_Buddy(): Int64 {
        __trace.append("[extend_C_I.foo_Buddy]")
        1i64
    }
    public func boo_Buddy(): Int64 {
        __trace.append("[extend_C_I.boo_Buddy]")
        1i64
    }
}

func test843<M>(m: M): Unit where M <: I_Buddy {
    m.foo_Buddy()
    m.boo_Buddy()
}

main(): Unit {
    let obj0: C = C()
    test843<C>(C())
    let ext0: I = C()
    ext0.foo_Buddy()
    ext0.boo_Buddy()
    if (__trace.toString() == "[extend_C_I.foo_Buddy][extend_C_I.boo_Buddy][extend_C_I.foo_Buddy][extend_C_I.boo_Buddy]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
