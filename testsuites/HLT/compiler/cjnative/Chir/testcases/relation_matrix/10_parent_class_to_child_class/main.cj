/*
 * 关系矩阵 10 | parent_class_to_child_class
 * 候选来源：父类已实现成员；覆盖方向：父类 → 子类（子类 override 覆盖父类）。
 * 构造：class P 实现 foo；class S <: P 用 override 覆盖 foo。泛型实例化到 S 时
 *       按需查询选取子类覆盖的 S.foo，而非父类 P.foo。
 * 预期：trace=[S.foo]，-O0/-O2 一致；证明 class 继承链上的 override 覆盖被正确选取。
 */
// Level: 1
// Description:
// 关系矩阵 10_parent_class_to_child_class | 成员来源×覆盖方向决策矩阵正向,实例化按需选型命中预期版本。
// 预期 -O0/-O2 双跑编译链接运行成功,输出 TRACE_OK,stderr 无 MISMATCH/undefined symbol。
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
// ASSERT: scan TRACE_OK
// ASSERT: scan-not MISMATCH
// ASSERT: scan-not undefined symbol

package geninst_rm10

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
