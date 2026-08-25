/*
 * TC-GENINST-SEED | DFX case3 | 六步③本类型 | 谓词 TC-GENINST-003
 * 需求 design-spec §7: 子类自身 override 覆盖父类与接口,实例化选取子类版本。
 * 手写落地(已验证 O0/O2 TRACE_OK)。
 */
// Level: 1
// Description:
// 六步种子 DFX_case3 | 泛型实例化按需选型正向。父接口默认/子覆盖/六步选取,实例化命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I1<T0> {
    func foo(): Int64 {
        __trace.append("[I1.foo]")
        1i64
    }
}

open class A1 {
    public open func foo(): Int64 {
        __trace.append("[A1.foo]")
        1i64
    }
}

class A2 <: A1 & I1<Int64> {
    public override func foo(): Int64 {
        __trace.append("[A2.foo]")
        1i64
    }
}

main(): Unit {
    let obj0: A1 = A1()
    obj0.foo()
    let obj1: A2 = A2()
    obj1.foo()
    let poly2: A1 = A2()
    poly2.foo()
    let iface3: I1<Int64> = A2()
    iface3.foo()
    if (__trace.toString() == "[A1.foo][A2.foo][A2.foo][A2.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
