// (Linux) EXEC: %compiler %cmp_opt -g %n.cj -o %n.%suffix -j1 --save-temps=.
// (Linux) EXEC: $CANGJIE_HOME/third_party/llvm/bin/llvm-dis %n.bc
// (Linux) EXEC: %cat %n.ll | compare %f
// (Linux) ASSERT: regex (?P<num1>!\d+) = !DISubprogram\(name: "fun_1", linkageName: "_CN7defaultXRNY_2R2IG_G0_E5fun_1HRNY_2R1IG_Ei", scope: !\d+, file: !\d+, line: \d+, type: (?P<num2>!\d+)
// (Linux) ASSERT: regex (?P=num2) = !DISubroutineType\(types: (?P<num3>!\d+)\)
// (Linux) ASSERT: regex (?P=num3) = !{!\d+, !\d+, (?P<num4>!\d+), !\d+}
// (Linux) ASSERT: regex (?P=num4) = !DICompositeType\(tag: DW_TAG_structure_type, name: "R1<\$G_T1>", scope: !\d+, file: !\d+, line: \d+, size: \d+, elements: (?P<num5>!\d+)
// (Linux) ASSERT: regex (?P=num5) = !{!\d+, (?P<num6>!\d+), !\d+, !\d+, !\d+, !\d+}
// (Linux) ASSERT: regex (?P=num6) = !DIDerivedType\(tag: DW_TAG_member, name: "width", scope: !\d+, file: !\d+, line: \d+, baseType: (?P<num7>!\d+)
// (Linux) ASSERT: regex (?P=num7) = !DICompositeType\(tag: DW_TAG_structure_type, name: "\$G_T1"

public struct R1<T> {
    public var width: T
    public var length: T
    public init(side: T) {
        this(side, side)
    }
    public init(par_1: T, par_2: T) {
        this.width = par_1
        this.length = par_2
    }
}

public struct R2<T1, T2> {
    public var num1: T1
    private var num2: T2
    public static var num11: Int8 = 10
    public init(pa_1: T1, pa_2: T2) {
        this.num1 = pa_1
        this.num2 = pa_2
    }
    public func fun_1() : Unit {
        let mc_1 = R1<Int64>(10)
        let mc_2 = R2<Int64, UInt32>(-12, 64)

    }
}

extend<T1, T2> R2<T1, T2> {
    public func fun_1(p1: T1, p2: T2) : R2<T1, T2> {
        var res = R2<T1, T2>(p1, p2)
        return res
    }

    public func fun_1(p1: R1<T1>, p2!: Int32 = 32) : R2<T1, Int32> {
        var res = R2<T1, Int32>(p1.width, p2)
        return res
    }
}

main() {
    let r1 = R1<Int32>(1)
}