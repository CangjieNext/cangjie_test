/*
 * TC-GENINST-CROSS-PACKAGE | 跨包扩展/缓存隔离 — 包 pkg_a
 * 需求 design-spec §3(包可见性/orphan 规则)/§6 可靠性(跨包不串)。
 * pkg_a 对外导出接口 I 与 class A(A 实现 I)。
 * 根包 import pkg_a 并写泛型函数约束 T <: I,实例化到 A 触发跨包按需查询。
 */
package pkg_a

public interface I {
    func foo(): Int64
}

public class A <: I {
    public func foo(): Int64 {
        1
    }
}
