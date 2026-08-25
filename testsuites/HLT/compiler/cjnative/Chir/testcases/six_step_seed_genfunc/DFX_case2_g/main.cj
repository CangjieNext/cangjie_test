/*
 * 六步②父类覆盖·泛型函数触发 | 对应 design-spec §3 第②步 + §7 DFX case2
 * 继承图复用 DFX_case2,但触发形态改为泛型函数 k<T>(a: T) where T <: I1,
 * 走按需查询 FindImplFuncForAbstractFunc / OverrideFunctionResolver 真路径,
 * 而非接口引用分发的 vtable 运行时分派。
 * 预期: 实例化选取父类 A1.foo(type-wins),trace=[A1.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 六步种子(泛型函数版) DFX_case2_g | 泛型函数实例化按需选型正向,与同 case 非泛型函数版对齐。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_case2_g

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func foo(): Unit {
        __trace.append("[I1.foo]")
    }
}

open class A1 {
    public open func foo(): Unit {
        __trace.append("[A1.foo]")
    }
}

class A2 <: A1 & I1 {}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}

main(): Unit {
    k<A2>(A2())
    if (__trace.toString() == "[A1.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
