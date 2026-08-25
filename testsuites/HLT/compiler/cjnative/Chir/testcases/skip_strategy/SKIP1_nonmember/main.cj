/*
 * 跳过策略1: 非成员/非虚成员忽略 | 对应 design-spec §3 跳过策略第1条
 * 规则: !fd.outerDecl || !IsVirtualMember(fd) → 返回原 fd 不重排。
 *      private 成员不可覆盖(IsVirtualMember 判定为非虚),不参与按需查询重排。
 * 构造: 类 C 同时有 private _foo(非虚,跳过)与 public foo(实现接口)。
 *       private _foo 不被识别为接口 I1.foo 的实现,public foo 被选中。
 * 预期: 泛型函数 k<C> 触发按需查询,选中 public foo,trace=[C.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 跳过策略 SKIP1_nonmember | 按需查询的跳过分支(非成员/接口非静态/类自身/基类型同类型),不实例化仍正确。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_skip1

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func foo(): Unit
}

class C <: I1 {
    private func _foo(): Unit {
        __trace.append("[C._foo(private)]")
    }
    public func foo(): Unit {
        __trace.append("[C.foo]")
    }
}

func k<T>(a: T): Unit where T <: I1 {
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
