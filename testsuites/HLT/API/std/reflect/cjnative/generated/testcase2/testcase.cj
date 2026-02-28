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
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.get("upstream.Enum<Int64, Int64>").construct("A", []))
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").construct("C(upstream.Struct, upstream.Class)", [Struct(), Class()]))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").construct("F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()]))
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.A", EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("C", argsCount: 2i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("F", argsCount: 4i64).qualifiedName)
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("C", argsCount: 2i64).apply(Struct(), Class()))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("F", argsCount: 4i64).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("C", argsCount: 2i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").getConstructor("F", argsCount: 4i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.C(Struct(), Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.C(Struct(), Class()))[1i64], [Struct(), Class()])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[enumConstructor](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", name: "F", parameters: ["Int64", "Tuple<Int64, Int64>", "Closure<(Int64)->Int64>", "upstream.GenericClass<Int64>"]))
        @Expect[readOnlyList](EnumTypeInfo.get("upstream.Enum<Int64, Int64>").destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[1i64], [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.A").apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)").apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)").apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)").apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.A).apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.A).getAssociatedValues(Enum<Int64, Int64>.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getAssociatedValues(Enum<Int64, Int64>.C(Struct(), Class())), [Struct(), Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).getAssociatedValues(Enum<Int64, Int64>.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getAssociatedValues(Enum<Int64, Int64>.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).getAssociatedValues(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())), [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of(Enum<Int64, Int64>.A).construct("A", []))
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum<Int64, Int64>.A).construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of(Enum<Int64, Int64>.A).construct("C(upstream.Struct, upstream.Class)", [Struct(), Class()]))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of(Enum<Int64, Int64>.A).construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum<Int64, Int64>.A).construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of(Enum<Int64, Int64>.A).construct("F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()]))
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.A", EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("C", argsCount: 2i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("F", argsCount: 4i64).qualifiedName)
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("C", argsCount: 2i64).apply(Struct(), Class()))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("F", argsCount: 4i64).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.A).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("C", argsCount: 2i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.A).getConstructor("F", argsCount: 4i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.C(Struct(), Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.C(Struct(), Class()))[1i64], [Struct(), Class()])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", name: "F", parameters: ["Int64", "Tuple<Int64, Int64>", "Closure<(Int64)->Int64>", "upstream.GenericClass<Int64>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.A).destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[1i64], [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.A").apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)").apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)").apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)").apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.A).apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.A).getAssociatedValues(Enum<Int64, Int64>.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getAssociatedValues(Enum<Int64, Int64>.C(Struct(), Class())), [Struct(), Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).getAssociatedValues(Enum<Int64, Int64>.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getAssociatedValues(Enum<Int64, Int64>.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).getAssociatedValues(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())), [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).construct("A", []))
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).construct("C(upstream.Struct, upstream.Class)", [Struct(), Class()]))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).construct("F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()]))
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.A", EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("C", argsCount: 2i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("F", argsCount: 4i64).qualifiedName)
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("C", argsCount: 2i64).apply(Struct(), Class()))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("F", argsCount: 4i64).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("C", argsCount: 2i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getConstructor("F", argsCount: 4i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.C(Struct(), Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.C(Struct(), Class()))[1i64], [Struct(), Class()])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", name: "F", parameters: ["Int64", "Tuple<Int64, Int64>", "Closure<(Int64)->Int64>", "upstream.GenericClass<Int64>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[1i64], [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.A").apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)").apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)").apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)").apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.A).apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.A).getAssociatedValues(Enum<Int64, Int64>.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getAssociatedValues(Enum<Int64, Int64>.C(Struct(), Class())), [Struct(), Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).getAssociatedValues(Enum<Int64, Int64>.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getAssociatedValues(Enum<Int64, Int64>.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).getAssociatedValues(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())), [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).construct("A", []))
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).construct("C(upstream.Struct, upstream.Class)", [Struct(), Class()]))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).construct("F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()]))
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.A", EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("C", argsCount: 2i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("F", argsCount: 4i64).qualifiedName)
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("C", argsCount: 2i64).apply(Struct(), Class()))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("F", argsCount: 4i64).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("C", argsCount: 2i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getConstructor("F", argsCount: 4i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.C(Struct(), Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.C(Struct(), Class()))[1i64], [Struct(), Class()])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", name: "F", parameters: ["Int64", "Tuple<Int64, Int64>", "Closure<(Int64)->Int64>", "upstream.GenericClass<Int64>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[1i64], [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.A").apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)").apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)").apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)").apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.A).apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.A).getAssociatedValues(Enum<Int64, Int64>.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getAssociatedValues(Enum<Int64, Int64>.C(Struct(), Class())), [Struct(), Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).getAssociatedValues(Enum<Int64, Int64>.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getAssociatedValues(Enum<Int64, Int64>.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).getAssociatedValues(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())), [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).construct("A", []))
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).construct("C(upstream.Struct, upstream.Class)", [Struct(), Class()]))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).construct("F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()]))
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.A", EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("C", argsCount: 2i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("F", argsCount: 4i64).qualifiedName)
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("C", argsCount: 2i64).apply(Struct(), Class()))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("F", argsCount: 4i64).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("C", argsCount: 2i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getConstructor("F", argsCount: 4i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.C(Struct(), Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.C(Struct(), Class()))[1i64], [Struct(), Class()])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[enumConstructor](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", name: "F", parameters: ["Int64", "Tuple<Int64, Int64>", "Closure<(Int64)->Int64>", "upstream.GenericClass<Int64>"]))
        @Expect[readOnlyList](EnumTypeInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[1i64], [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.A").apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)").apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)").apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)").apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.A).apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.A).getAssociatedValues(Enum<Int64, Int64>.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getAssociatedValues(Enum<Int64, Int64>.C(Struct(), Class())), [Struct(), Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).getAssociatedValues(Enum<Int64, Int64>.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getAssociatedValues(Enum<Int64, Int64>.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).getAssociatedValues(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())), [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of<Enum<Int64, Int64>>().construct("A", []))
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of<Enum<Int64, Int64>>().construct("B(Int64, Bool, Float64)", [1i64, true, 114.514000f64]))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of<Enum<Int64, Int64>>().construct("C(upstream.Struct, upstream.Class)", [Struct(), Class()]))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of<Enum<Int64, Int64>>().construct("D(Tuple<Unit, Unit>)", [((), ())]))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of<Enum<Int64, Int64>>().construct("E(Closure<(Int64)->Bool>)", [{p0: Int64 =>true
}]))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of<Enum<Int64, Int64>>().construct("F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()]))
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.A", EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("A", argsCount: 0i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("B", argsCount: 3i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("C", argsCount: 2i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("D", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("E", argsCount: 1i64).qualifiedName)
        @Expect[anyValue]("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("F", argsCount: 4i64).qualifiedName)
        @Expect[anyValue](Enum<Int64, Int64>.A, EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("A", argsCount: 0i64).apply())
        @Expect[anyValue](Enum<Int64, Int64>.B(1i64, true, 114.514000f64), EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("B", argsCount: 3i64).apply(1i64, true, 114.514000f64))
        @Expect[anyValue](Enum<Int64, Int64>.C(Struct(), Class()), EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("C", argsCount: 2i64).apply(Struct(), Class()))
        @Expect[anyValue](Enum<Int64, Int64>.D(((), ())), EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("D", argsCount: 1i64).apply(((), ())))
        @Expect[anyValue](Enum<Int64, Int64>.E({p0: Int64 =>true
}), EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("E", argsCount: 1i64).apply({p0: Int64 =>true
}))
        @Expect[anyValue](Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("F", argsCount: 4i64).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[annotations](EnumTypeInfo.of<Enum<Int64, Int64>>().annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("A", argsCount: 0i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("B", argsCount: 3i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("C", argsCount: 2i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("D", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("E", argsCount: 1i64).annotations, [])
        @Expect[annotations](EnumTypeInfo.of<Enum<Int64, Int64>>().getConstructor("F", argsCount: 4i64).annotations, [])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.A)[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.A", name: "A", parameters: []))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.A)[1i64], [])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)", name: "B", parameters: ["Int64", "Bool", "Float64"]))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.B(1i64, true, 114.514000f64))[1i64], [1i64, true, 114.514000f64])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.C(Struct(), Class()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)", name: "C", parameters: ["upstream.Struct", "upstream.Class"]))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.C(Struct(), Class()))[1i64], [Struct(), Class()])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.D(((), ())))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)", name: "D", parameters: ["Tuple<Unit, Unit>"]))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.D(((), ())))[1i64], [((), ())])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)", name: "E", parameters: ["Closure<(Int64)->Bool>"]))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.E({p0: Int64 =>true
}))[1i64], [{p0: Int64 =>true
}])
        @Expect[enumConstructor](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[0i64], EnumConstructor(qualifiedName: "upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)", name: "F", parameters: ["Int64", "Tuple<Int64, Int64>", "Closure<(Int64)->Int64>", "upstream.GenericClass<Int64>"]))
        @Expect[readOnlyList](EnumTypeInfo.of<Enum<Int64, Int64>>().destruct(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))[1i64], [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.A").apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.B(Int64, Bool, Float64)").apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.C(upstream.Struct, upstream.Class)").apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.D(Tuple<Unit, Unit>)").apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.E(Closure<(Int64)->Bool>)").apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.get("upstream.Enum<Int64, Int64>.F(Int64, Tuple<Int64, Int64>, Closure<(Int64)->Int64>, upstream.GenericClass<Int64>)").apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.A).apply(), Enum<Int64, Int64>.A)
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).apply(1i64, true, 114.514000f64), Enum<Int64, Int64>.B(1i64, true, 114.514000f64))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).apply(Struct(), Class()), Enum<Int64, Int64>.C(Struct(), Class()))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).apply(((), ())), Enum<Int64, Int64>.D(((), ())))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).apply({p0: Int64 =>true
}), Enum<Int64, Int64>.E({p0: Int64 =>true
}))
        @Expect[anyValue](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).apply(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()), Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()))
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.A).getAssociatedValues(Enum<Int64, Int64>.A), [])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)).getAssociatedValues(Enum<Int64, Int64>.B(1i64, true, 114.514000f64)), [1i64, true, 114.514000f64])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.C(Struct(), Class())).getAssociatedValues(Enum<Int64, Int64>.C(Struct(), Class())), [Struct(), Class()])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.D(((), ()))).getAssociatedValues(Enum<Int64, Int64>.D(((), ()))), [((), ())])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.E({p0: Int64 =>true
})).getAssociatedValues(Enum<Int64, Int64>.E({p0: Int64 =>true
})), [{p0: Int64 =>true
}])
        @Expect[readOnlyList](EnumConstructorInfo.of(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())).getAssociatedValues(Enum<Int64, Int64>.F(1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>())), [1i64, (1i64, 1i64), {p0: Int64 =>1i64
}, GenericClass<Int64>()])
    }
}
