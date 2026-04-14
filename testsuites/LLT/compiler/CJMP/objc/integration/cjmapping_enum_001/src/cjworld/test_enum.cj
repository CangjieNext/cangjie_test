package cjworld

import interoplib.objc.*

public enum Enum_01 {
 	     | Circle(Float64)
 	     | Rectangle(Float64, Float64)
}

public enum Enum_02 {
    | Value(Int64)
    | Empty

    public func getValueOrDefault(): Int64 {
        match (this) {
            case Value(v) => return v
            case Empty => return 0
        }
    }
}

public enum Enum_03 {
 	     | Num(Int64)
 	     | Add(Enum_03, Enum_03)
 	     | Sub(Enum_03, Enum_03)
}

public enum Enum_04 {
 	     | Li(Int64)
 	     | Li(Int64, Int64)
 	     | Li(Int64, Int64, Int64)
}