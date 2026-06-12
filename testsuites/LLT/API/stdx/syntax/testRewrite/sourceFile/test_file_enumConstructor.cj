public enum B {
    | @Deprecated["EnumA"]
    EnumA
    | @EnumField["EnumB"]
    EnumB
    | @EnumField[v: "EnumC"]
    EnumC(a, b)
    | @!EnumField["EnumD"]
    EnumD
    | @!EnumField[v: "EnumE"]
    EnumE(a, b)
    | @!EnumField
    @EnumField[v: "EnumF"]
    @!EnumField[v: "EnumF"]
    EnumF(a, b)
    | ...
    func a() {}
}