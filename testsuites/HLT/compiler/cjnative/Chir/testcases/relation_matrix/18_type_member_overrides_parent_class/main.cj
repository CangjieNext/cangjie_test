/*
 * 关系矩阵 18 | type_member_overrides_parent_class
 * 候选来源：类型自身成员 vs 父类成员；覆盖方向：类型自身 override 覆盖父类。
 * 构造：class P 实现 foo；class S <: P 用 override 覆盖 foo。泛型实例化到 S 时
 *       按需查询优先选取类型自身 S.foo，而非父类 P.foo。
 * 预期：trace=[S.foo]，-O0/-O2 一致；类型自身优先于父类。
 */
// Level: 1
// Description:
// 关系矩阵 18_type_member_overrides_parent_class | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm18

import std.collection.*

var __trace: StringBuilder = StringBuilder()

open class P {
    public open func foo(): Unit {
        __trace.append("[P.foo]")
    }
}

class S <: P {
    public override func foo(): Unit {
        __trace.append("[S.foo]")
    }
}

func k<T>(a: T): Unit where T <: P {
    a.foo()
}

main(): Unit {
    k<S>(S())
    if (__trace.toString() == "[S.foo]") {
        println("TRACE_OK")
    } else {
        println("MISMATCH " + __trace.toString())
    }
}
