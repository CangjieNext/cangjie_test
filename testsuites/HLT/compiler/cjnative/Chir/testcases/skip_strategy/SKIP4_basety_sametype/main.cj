/*
 * 跳过策略4: baseTy 找到的被覆盖函数与语义 target 在同类型 → 使用语义结果 | design-spec §3 跳过策略第4条
 * 规则: 通过 baseTy 找到的被覆盖函数与语义提供的 target 在同类型中
 *       → 使用语义结果,不二次重排。
 * 构造: 父类 A1 有 open foo,子类 A2 <: A1 & I1 override foo。
 *       经泛型函数 k<A2> 触发,baseTy=A2 找到 A2 的 override 版本,与语义 target 同类型 → 跳过4。
 * 预期: 使用语义结果调 A2.foo,trace=[A2.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 跳过策略 SKIP4_basety_sametype | 按需查询的跳过分支(非成员/接口非静态/类自身/基类型同类型),不实例化仍正确。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_skip4

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

class A2 <: A1 & I1 {
    public override func foo(): Unit {
        __trace.append("[A2.foo]")
    }
}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}

main(): Unit {
    k<A2>(A2())
    if (__trace.toString() == "[A2.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
