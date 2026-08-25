/*
 * TC-GENINST-MULTI-PARENT | 无关默认冲突/显式消歧（正向侧）
 * 需求 design-spec §3(direct_unrelated_defaults)/§6；dt-design 异常用例3。
 *
 * 构造：接口 I1、I2（无父子关系）各带同名 foo 默认实现；class C <: I1 & I2
 * 提供显式实现 foo。泛型函数约束 T <: I1，实例化到 C 时按需查询命中本类型版本 C.foo，
 * 而非任一无关默认，且与声明顺序无关（对照同目录 conflict_part.cj 的无显式实现被拒绝）。
 */
// Level: 1
// Description:
// TC-GENINST-MULTI-PARENT | 无关默认冲突/显式消歧(正向侧),实例化命中本类型 C.foo 而非任一无关默认。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package packageA

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func foo(): Int64 {
        __trace.append("[I1.foo]")
        1i64
    }
}

interface I2 {
    func foo(): Int64 {
        __trace.append("[I2.foo]")
        2i64
    }
}

class C <: I1 & I2 {
    public func foo(): Int64 {
        __trace.append("[C.foo]")
        3i64
    }
}

func g<T>(x: T): Int64 where T <: I1 {
    x.foo()
}

main(): Unit {
    let direct = C().foo()
    let inst = g<C>(C())
    if (direct == 3i64 && inst == 3i64 && __trace.toString() == "[C.foo][C.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH direct=${direct} inst=${inst} trace=${__trace.toString()}")
    }
}
