/*
 * 跳过策略3: 通过 Class 访问且语义 target 是本类型的方法忽略 | design-spec §3 跳过策略第3条
 * 规则: ty.IsClass() && GetDeclPtrOfTy(fd.outerDecl->GetTy()) == GetDeclPtrOfTy(&ty)
 *       → 已经是最终调用版本,返回原 fd 不重排。
 * 构造: 类 C 实现接口 I1 的 foo,语义 target 即本类方法。
 *       经泛型函数 k<C>(c) 触发,baseTy=C(Class),target 在 C 本身 → 跳过3,不二次重排。
 * 预期: 直接调 C.foo,trace=[C.foo],-O0/-O2 一致。
 */
// Level: 1
// Description:
// 跳过策略 SKIP3_class_self | 按需查询的跳过分支(非成员/接口非静态/类自身/基类型同类型),不实例化仍正确。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_skip3

import std.collection.*

var __trace: StringBuilder = StringBuilder()

interface I1 {
    func foo(): Unit {
        __trace.append("[I1.foo]")
    }
}

class C <: I1 {
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
