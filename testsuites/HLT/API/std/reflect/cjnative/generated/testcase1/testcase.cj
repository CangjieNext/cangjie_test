/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// Level: 1
// Description:
// DEPENDENCE: utils upstream
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %compile_lib_opt -p utils
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %compile_lib_opt -p upstream
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %f -L . -lutils -lupstream %cmp_utest_opt -o %output
// (!(target_mac | target_ios)) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import utils.*
import upstream.*
import std.reflect.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

@Test
class MyTest {
    @TestCase
    func testCase0(): Unit {
        @Expect[anyValue](Enum.A, EnumTypeInfo.get("upstream.Enum").construct("A", []))
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.get("upstream.Enum").construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.get("upstream.Enum").construct("C(upstream.Struct, upstream.Enum, upstream.Class)", [Struct(), Enum.A, Class()]))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.get("upstream.Enum").construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.get("upstream.Enum").construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue]("upstream.Enum.A", EnumTypeInfo.get("upstream.Enum").getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.B(Int64, Bool, Float64)", EnumTypeInfo.get("upstream.Enum").getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", EnumTypeInfo.get("upstream.Enum").getConstructor("C", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.D(Tuple<Unit, Unit>)", EnumTypeInfo.get("upstream.Enum").getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.E(Closure<(Int64)->Bool>)", EnumTypeInfo.get("upstream.Enum").getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue](Enum.A, EnumTypeInfo.get("upstream.Enum").getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.get("upstream.Enum").getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.get("upstream.Enum").getConstructor("C", argsCount: 3i64).apply(Struct(), Enum.A, Class()))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.get("upstream.Enum").getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.get("upstream.Enum").getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum").annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum").getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum").getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum").getConstructor("C", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum").getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum").getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum").destruct(Enum.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum").destruct(Enum.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum").destruct(Enum.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum").destruct(Enum.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum").destruct(Enum.C(Struct(), Enum.A, Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Enum", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum").destruct(Enum.C(Struct(), Enum.A, Class()))[1i64], [Struct(), Enum.A, Class()])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum").destruct(Enum.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum").destruct(Enum.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum").destruct(Enum.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum").destruct(Enum.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.A").apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)").apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.D(Tuple<Unit, Unit>)").apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.A).apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.D(((), ()))).apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.A).getAssociatedValues(Enum.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).getAssociatedValues(Enum.C(Struct(), Enum.A, Class())), [Struct(), Enum.A, Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.D(((), ()))).getAssociatedValues(Enum.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).getAssociatedValues(Enum.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[anyValue](Enum.A, EnumTypeInfo.of(Enum.A).construct("A", []))
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum.A).construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of(Enum.A).construct("C(upstream.Struct, upstream.Enum, upstream.Class)", [Struct(), Enum.A, Class()]))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of(Enum.A).construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum.A).construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue]("upstream.Enum.A", EnumTypeInfo.of(Enum.A).getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.B(Int64, Bool, Float64)", EnumTypeInfo.of(Enum.A).getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", EnumTypeInfo.of(Enum.A).getConstructor("C", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.D(Tuple<Unit, Unit>)", EnumTypeInfo.of(Enum.A).getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of(Enum.A).getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue](Enum.A, EnumTypeInfo.of(Enum.A).getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum.A).getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of(Enum.A).getConstructor("C", argsCount: 3i64).apply(Struct(), Enum.A, Class()))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of(Enum.A).getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum.A).getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[annotations](EnumTypeInfo.of(Enum.A).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.A).getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.A).getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.A).getConstructor("C", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.A).getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.A).getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.A).destruct(Enum.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.A).destruct(Enum.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.A).destruct(Enum.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.A).destruct(Enum.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.A).destruct(Enum.C(Struct(), Enum.A, Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Enum", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.A).destruct(Enum.C(Struct(), Enum.A, Class()))[1i64], [Struct(), Enum.A, Class()])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.A).destruct(Enum.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.A).destruct(Enum.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.A).destruct(Enum.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.A).destruct(Enum.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.A").apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)").apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.D(Tuple<Unit, Unit>)").apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.A).apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.D(((), ()))).apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.A).getAssociatedValues(Enum.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).getAssociatedValues(Enum.C(Struct(), Enum.A, Class())), [Struct(), Enum.A, Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.D(((), ()))).getAssociatedValues(Enum.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).getAssociatedValues(Enum.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[anyValue](Enum.A, EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).construct("A", []))
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).construct("C(upstream.Struct, upstream.Enum, upstream.Class)", [Struct(), Enum.A, Class()]))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue]("upstream.Enum.A", EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.B(Int64, Bool, Float64)", EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("C", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.D(Tuple<Unit, Unit>)", EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue](Enum.A, EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("C", argsCount: 3i64).apply(Struct(), Enum.A, Class()))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[annotations](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("C", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.C(Struct(), Enum.A, Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Enum", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.C(Struct(), Enum.A, Class()))[1i64], [Struct(), Enum.A, Class()])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.B(1i64, true, 114.514000f64)).destruct(Enum.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.A").apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)").apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.D(Tuple<Unit, Unit>)").apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.A).apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.D(((), ()))).apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.A).getAssociatedValues(Enum.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).getAssociatedValues(Enum.C(Struct(), Enum.A, Class())), [Struct(), Enum.A, Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.D(((), ()))).getAssociatedValues(Enum.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).getAssociatedValues(Enum.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[anyValue](Enum.A, EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).construct("A", []))
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).construct("C(upstream.Struct, upstream.Enum, upstream.Class)", [Struct(), Enum.A, Class()]))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue]("upstream.Enum.A", EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.B(Int64, Bool, Float64)", EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("C", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.D(Tuple<Unit, Unit>)", EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue](Enum.A, EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("C", argsCount: 3i64).apply(Struct(), Enum.A, Class()))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[annotations](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("C", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.C(Struct(), Enum.A, Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Enum", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.C(Struct(), Enum.A, Class()))[1i64], [Struct(), Enum.A, Class()])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.C(Struct(), Enum.A, Class())).destruct(Enum.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.A").apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)").apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.D(Tuple<Unit, Unit>)").apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.A).apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.D(((), ()))).apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.A).getAssociatedValues(Enum.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).getAssociatedValues(Enum.C(Struct(), Enum.A, Class())), [Struct(), Enum.A, Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.D(((), ()))).getAssociatedValues(Enum.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).getAssociatedValues(Enum.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[anyValue](Enum.A, EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).construct("A", []))
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).construct("C(upstream.Struct, upstream.Enum, upstream.Class)", [Struct(), Enum.A, Class()]))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue]("upstream.Enum.A", EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.B(Int64, Bool, Float64)", EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("C", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.D(Tuple<Unit, Unit>)", EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue](Enum.A, EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("C", argsCount: 3i64).apply(Struct(), Enum.A, Class()))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[annotations](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("C", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.C(Struct(), Enum.A, Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Enum", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.C(Struct(), Enum.A, Class()))[1i64], [Struct(), Enum.A, Class()])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum.E({p0: Int64 =>true
})).destruct(Enum.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.A").apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)").apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.D(Tuple<Unit, Unit>)").apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.A).apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.D(((), ()))).apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.A).getAssociatedValues(Enum.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).getAssociatedValues(Enum.C(Struct(), Enum.A, Class())), [Struct(), Enum.A, Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.D(((), ()))).getAssociatedValues(Enum.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).getAssociatedValues(Enum.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[anyValue](Enum.A, EnumTypeInfo.of<Enum>().construct("A", []))
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of<Enum>().construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of<Enum>().construct("C(upstream.Struct, upstream.Enum, upstream.Class)", [Struct(), Enum.A, Class()]))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of<Enum>().construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of<Enum>().construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue]("upstream.Enum.A", EnumTypeInfo.of<Enum>().getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.B(Int64, Bool, Float64)", EnumTypeInfo.of<Enum>().getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", EnumTypeInfo.of<Enum>().getConstructor("C", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.D(Tuple<Unit, Unit>)", EnumTypeInfo.of<Enum>().getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of<Enum>().getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue](Enum.A, EnumTypeInfo.of<Enum>().getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum.B(1i64, true, 114.514000f64), EnumTypeInfo.of<Enum>().getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum.C(Struct(), Enum.A, Class()), EnumTypeInfo.of<Enum>().getConstructor("C", argsCount: 3i64).apply(Struct(), Enum.A, Class()))
        @Expect[anyValue](Enum.D(((), ())), EnumTypeInfo.of<Enum>().getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum.E({p0: Int64 =>true
}), EnumTypeInfo.of<Enum>().getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[annotations](EnumTypeInfo.of<Enum>().annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum>().getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum>().getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum>().getConstructor("C", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum>().getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum>().getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum>().destruct(Enum.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum>().destruct(Enum.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum>().destruct(Enum.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum>().destruct(Enum.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum>().destruct(Enum.C(Struct(), Enum.A, Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Enum", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum>().destruct(Enum.C(Struct(), Enum.A, Class()))[1i64], [Struct(), Enum.A, Class()])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum>().destruct(Enum.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum>().destruct(Enum.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum>().destruct(Enum.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum>().destruct(Enum.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.A").apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.C(upstream.Struct, upstream.Enum, upstream.Class)").apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.D(Tuple<Unit, Unit>)").apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.A).apply(), Enum.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).apply(Struct(), Enum.A, Class()), Enum.C(Struct(), Enum.A, Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.D(((), ()))).apply(((), ())), Enum.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum.E({p0: Int64 =>true
}))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.A).getAssociatedValues(Enum.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.C(Struct(), Enum.A, Class())).getAssociatedValues(Enum.C(Struct(), Enum.A, Class())), [Struct(), Enum.A, Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.D(((), ()))).getAssociatedValues(Enum.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum.E({p0: Int64 =>true
})).getAssociatedValues(Enum.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
    }
}
