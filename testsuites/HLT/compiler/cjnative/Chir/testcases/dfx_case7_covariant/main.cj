/*
 * TC-GENINST-DFX7 | 协变返回类型实例化选型 | P0 External
 * 需求 design-spec §7 case7: A1.foo 返回 Return2 覆盖 I1.foo 返回 Return1(Return2 <: Return1)。
 * 预期: 实例化选取 A1.foo(输出 A1),-O0/-O2 一致。
 * cjc 1.3.0-alpha.02 实测支持(编译通过,输出 A1)。
 * cjc 1.3.0 实测支持协变返回,本套件直接落 design-spec 源码。
 */
// Level: 1
// Description:
// DFX case7 | 协变返回类型实例化选型,实例化选取 A1.foo(返回 Return2 覆盖 Return1),输出 A1。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 A1(协变返回选取 A1 版本),stderr 无 undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan A1
// ASSERT: scan-not I1
// ASSERT: scan-not undefined symbol

open class Return1 {}

class Return2 <: Return1 {}

interface I1 {
    func foo(): Return1 { println("I1"); Return1() }
}

class A1 <: I1 {
    public func foo(): Return2 { println("A1"); Return2() } // 选取这个。
}

func k<T>(a: T): Unit where T <: I1 {
    a.foo()
}

main() {
    k<A1>(A1())
}
