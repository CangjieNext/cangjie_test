/*
 * TC-GENINST-SEED | DFX case6 | 六步⑤扩展自身 + 父类 + ⑥type-wins | 谓词 TC-GENINST-005/006
 * 需求 design-spec §7: 父类方法存在时扩展自身不覆盖,type-wins 选父类版本。
 * 手写落地(已验证 O0/O2 TRACE_OK)。
 */
// Level: 1
// Description:
// 六步种子 DFX_case6 | 泛型实例化按需选型正向。父接口默认/子覆盖/六步选取,实例化命中预期版本。
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

interface I2<T0> <: I1<Int64> {
    func foo(): Int64 {
        __trace.append("[I2.foo]")
        1i64
    }
}

open class A1 {
    public open func foo(): Int64 {
        __trace.append("[A1.foo]")
        1i64
    }
}

class A2 <: A1 {}

extend A2 <: I1<Int64> {}

extend A2 <: I2<Int64> {}

main(): Unit {
    let obj0: A1 = A1()
    obj0.foo()
    let obj1: A2 = A2()
    let poly2: A1 = A2()
    poly2.foo()
    let ext0: I1<Int64> = A2()
    ext0.foo()
    let ext1: I2<Int64> = A2()
    ext1.foo()
    if (__trace.toString() == "[A1.foo][A1.foo][A1.foo][A1.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
