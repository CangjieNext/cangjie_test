/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import stdx.serialization.serialization.*
import std.collection.*

class MySerializeDemo <: Serializable<MySerializeDemo> {
    public static var value01 : Array<Int64> =[1,2,3]
    public static var value02 : ArrayList<Int64> = ArrayList<Int64>(10)
    public static var value03 : HashSet<Int64> = HashSet<Int64>([1,2,3])
    public static var value04 : HashMap<Int64,Int64> = HashMap<Int64,Int64>([(0,1)])

    public init(v1: Array<Int64>,v2: ArrayList<Int64>,v3: HashSet<Int64>,v4: HashMap<Int64,Int64>) {
        value01 = if (v1[0] >= 0) {
            v1
        } else {
           [2,2,3]
        }
        value02 = if (v2[0] >= 0) {
            v2
        } else {
            ArrayList<Int64>(10)
        }
        value03 = if (v3.size >= 0) {
            v3
        } else {
            HashSet<Int64>([1,2,3])
        }
        value04 = if (v4.size >= 0) {
            v4
        } else {
            HashMap<Int64,Int64>([(0,1)])
        }
    }

    public func serialize(): DataModel {
        return DataModelStruct().add(field<Array<Int64>>("value01", value01)).add(field<ArrayList<Int64>>("value02", value02)).add(field<HashSet<Int64>>("value03", value03)).add(field<HashMap<Int64,Int64>>("value04", value04))
    }

    public static func deserialize(s: DataModel): MySerializeDemo {
        let d = (s as DataModelStruct).getOrThrow()
        value01 = Array<Int64>.deserialize(d.get("value01"))
        value02 = ArrayList<Int64>.deserialize(d.get("value02"))
        value03 = HashSet<Int64>.deserialize(d.get("value03"))
        value04 = HashMap<Int64,Int64>.deserialize(d.get("value04"))
        MySerializeDemo[1,2,3],ArrayList<Int64>(10),HashSet<Int64>([1,2,3]),HashMap<Int64,Int64>([(0,1)]))
    }
}

main(){}
