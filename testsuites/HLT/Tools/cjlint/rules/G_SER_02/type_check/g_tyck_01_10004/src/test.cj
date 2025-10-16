import stdx.serialization.serialization.*

open class fatherclass1 {}
open class fatherclass2 <: fatherclass1 {}
open class fatherclass3 <: fatherclass2 {}
open class fatherclass4 <: fatherclass3 {}
open class fatherclass5 <: fatherclass4 {}
open class fatherclass6 <: fatherclass5 {}
open class fatherclass7 <: fatherclass6 {}
open class fatherclass8 <: fatherclass7 {}
open class fatherclass9 <: fatherclass8 {}
open class fatherclass10 <: fatherclass9 {}
open class fatherclass11 <: fatherclass10 {}
open class fatherclass12 <: fatherclass11 {}
open class fatherclass13 <: fatherclass12 {}
open class fatherclass14 <: fatherclass13 {}
open class fatherclass15 <: fatherclass14 {}
open class fatherclass16 <: fatherclass15 {}
open class fatherclass17 <: fatherclass16 {}
open class fatherclass18 <: fatherclass17 {}
open class fatherclass19 <: fatherclass18 {}
open class fatherclass20 <: fatherclass19 {}
open class fatherclass21 <: fatherclass20 {}
open class fatherclass22 <: fatherclass21 {}

open class MySerializeDemo04 <: fatherclass21 & Serializable<MySerializeDemo04> {
    public static var value: Int64 = 0

    public init(v: Int64) {
        value = if (v >= 0) {
            v
        } else {
            0
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Int64>("value", value))
    }

    public static func deserialize(s: DataModel): MySerializeDemo04 {
        let d = (s as DataModelStruct).getOrThrow()
        value = Int64.deserialize(d.get("value"))
        MySerializeDemo04(4)
    }
}

open class fatherclass23 <: MySerializeDemo04 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass24 <: fatherclass23 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass25 <: fatherclass24 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass26 <: fatherclass25 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass27 <: fatherclass26 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass28 <: fatherclass27 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass29 <: fatherclass28 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass30 <: fatherclass29 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass31 <: fatherclass30 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass32 <: fatherclass31 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass33 <: fatherclass32 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass34 <: fatherclass33 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass35 <: fatherclass34 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass36 <: fatherclass35 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass37 <: fatherclass36 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass38 <: fatherclass37 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass39 <: fatherclass38 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass40 <: fatherclass39 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass41 <: fatherclass40 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass42 <: fatherclass41 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass43 <: fatherclass42 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass44 <: fatherclass42 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass45 <: fatherclass44 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass46 <: fatherclass45 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass47 <: fatherclass46 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass48 <: fatherclass47 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass49 <: fatherclass48 {
    public init(a:Int64){
        super(a)
    }
}
open class fatherclass50 <: fatherclass49 {
    public init(a:Int64){
        super(a)
    }
}

main(){}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
