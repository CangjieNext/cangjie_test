/*
 * TC-GENINST-RECEIVER-KIND | 值类型(struct/enum)接收者的实例化选型
 * 需求 design-spec §3/§7:值类型接收者选取正确直接或扩展实现。
 * 本用例覆盖 class 之外的值类型接收者形态。
 *
 * 构造：interface I 声明 foo。
 *  - struct S 直接实现 I.foo（直接实现路径）。
 *  - struct S2 通过 extend<I> 扩展实现 I.foo（扩展实现路径）。
 *  - enum E 实现 I.foo（enum 接收者路径）。
 * 泛型函数 g<T> 约束 T <: I，实例化到 S/S2/E 时按需查询重排选取各自的实现。
 * -O0/-O2 双跑断言 trace 一致。
 */
// Level: 1
// Description:
// TC-GENINST-RECEIVER-KIND | 接收者形态(值/引用)对实例化选型的影响验证,输出 TRACE_OK。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I {
    func foo(): Int64
}

// ① struct 直接实现
struct S <: I {
    public func foo(): Int64 {
        __trace.append("[S.foo]")
        1i64
    }
}

// ② struct extend 扩展实现
struct S2 {
    public let v: Int64
    public init(v: Int64) { this.v = v }
}
extend S2 <: I {
    public func foo(): Int64 {
        __trace.append("[S2.foo]")
        2i64
    }
}

// ③ enum 实现
enum E <: I {
    | A | B
    public func foo(): Int64 {
        __trace.append("[E.foo]")
        3i64
    }
}

// 泛型上界 T <: I，实例化时按需查询重排选取值类型接收者的实现。
func g<T>(x: T): Int64 where T <: I {
    x.foo()
}

main(): Unit {
    let s = g<S>(S())
    let s2 = g<S2>(S2(0i64))
    let e = g<E>(E.A)
    if (s == 1i64 && s2 == 2i64 && e == 3i64 && __trace.toString() == "[S.foo][S2.foo][E.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH s=${s} s2=${s2} e=${e} trace=${__trace.toString()}")
    }
}
