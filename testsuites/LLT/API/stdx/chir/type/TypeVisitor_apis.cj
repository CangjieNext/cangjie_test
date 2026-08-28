/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %import-cangjie-stdx %cmp_opt -o %n.%suffix %f
// RUN-EXEC: %set_stdx_path %run %run_opt %n.%suffix %run_args | compare %f
// TypeVisitor.walk：CONTINUE / SKIP / STOP、默认 action、isStop 提前返回

/* SCAN
walk continue count: 5
walk skip count: 1
walk stop count: 2
walk after stop: 0
walk default action: 5
walk leaf continue: 1
*/

import stdx.chir.*

class CountContinueVisitor <: TypeVisitor {
    public var count: Int64 = 0

    public override func action(_: Type): TypeActionMode {
        count += 1
        return TypeActionMode.CONTINUE
    }
}

class SkipRootVisitor <: TypeVisitor {
    public var count: Int64 = 0

    public override func action(_: Type): TypeActionMode {
        count += 1
        return TypeActionMode.SKIP
    }
}

class StopAtVisitor <: TypeVisitor {
    public var count: Int64 = 0
    public let limit: Int64

    public init(limit: Int64) {
        this.limit = limit
    }

    public override func action(_: Type): TypeActionMode {
        count += 1
        if (count >= limit) {
            return TypeActionMode.STOP
        }
        return TypeActionMode.CONTINUE
    }
}

class SuperActionVisitor <: TypeVisitor {
    public var count: Int64 = 0

    public override func action(ty: Type): TypeActionMode {
        count += 1
        return super.action(ty)
    }
}

main() {
    // FuncType(Int32, Tuple(Bool, Unit)) -> 5 nodes if CONTINUE on all
    let i32 = IntType.getInt32()
    let tup = TupleType.get([BoolType.get(), UnitType.get()])
    let fty = FuncType.get([i32], tup)

    let c = CountContinueVisitor()
    c.walk(fty)
    println("walk continue count: ${c.count}")

    let s = SkipRootVisitor()
    s.walk(fty)
    println("walk skip count: ${s.count}")

    // STOP on 2nd node: root CONTINUE, then first arg STOP; remaining args hit isStop early return
    let st = StopAtVisitor(2)
    st.walk(fty)
    println("walk stop count: ${st.count}")
    // isStop already set: second walk returns immediately
    let before = st.count
    st.walk(fty)
    println("walk after stop: ${st.count - before}")

    let d = SuperActionVisitor()
    d.walk(fty)
    println("walk default action: ${d.count}")

    // leaf type: CONTINUE with empty typeArgs (for-loop 0 times)
    let leaf = CountContinueVisitor()
    leaf.walk(i32)
    println("walk leaf continue: ${leaf.count}")
}
