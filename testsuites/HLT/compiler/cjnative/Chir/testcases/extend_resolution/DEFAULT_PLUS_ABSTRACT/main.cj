/*
 * default + abstract 唯一选取 | 对应 coverage GAP default_plus_abstract_unique_select
 * 规则(SPEC §6 规则8/9): 同签名候选中只有一个默认实现时类型可不实现使用默认;
 *       一个 default 加一个 abstract 时选唯一 default;若仍有歧义(多个 default)则拒绝。
 * 构造: I1 提供 foo 默认实现,I2 仅声明 foo 抽象(无默认),C <: I1 & I2 不实现 foo。
 *       同签名只有一个 default → 选取 I1 的默认实现。
 * 预期: trace=[I1.f],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 扩展解析 DEFAULT_PLUS_ABSTRACT | extend 泛型成员合法匹配/默认+抽象唯一选取/跨方向 type-wins 正向。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_default_abstract

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func f(): Unit {
        __trace.append("[I1.f]")
    }
}

interface I2 {
    func f(): Unit
}

class C <: I1 & I2 {}

func k<T>(a: T): Unit where T <: I1 {
    a.f()
}

main(): Unit {
    k<C>(C())
    if (__trace.toString() == "[I1.f]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
