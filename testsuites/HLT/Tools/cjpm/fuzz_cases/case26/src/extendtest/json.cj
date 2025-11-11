/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test.extendtest

internal import stdx.encoding.json.*
internal import std.collection.*

/* 转 json 接口 */
public interface ShiftJson {
    func toJson(): JsonValue
}

/* Int8 扩展 */
extend Int8 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonInt(Int64(this))
    }
}

/* Int16 扩展 */
extend Int16 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonInt(Int64(this))
    }
}

/* Int32 扩展 */
extend Int32 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonInt(Int64(this))
    }
}

/* Int64 扩展 */
extend Int64 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonInt(this)
    }
}

/* IntNative 扩展 */
extend IntNative <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonInt(Int64(this))
    }
}

/* UInt8 扩展 */
extend UInt8 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonInt(Int64(this))
    }
}

/* UInt16 扩展 */
extend UInt16 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonInt(Int64(this))
    }
}

/* UInt32 扩展 */
extend UInt32 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonInt(Int64(this))
    }
}

/* UInt64 扩展 */
extend UInt64 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonString(this.toString())
    }
}

/* UIntNative 扩展 */
extend UIntNative <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonString(this.toString())
    }
}

/* Float16 扩展 */
extend Float16 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonFloat(Float64(this))
    }
}

/* Float32 扩展 */
extend Float32 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonFloat(Float64(this))
    }
}

/* Float64 扩展 */
extend Float64 <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonFloat(this)
    }
}

/* Bool 扩展 */
extend Bool <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonBool(this)
    }
}

/* Rune 扩展 */
extend Rune <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonString(this.toString())
    }
}

/* String 扩展 */
extend String <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonString(this)
    }
}

/* Unit 扩展 */
extend Unit <: ShiftJson {
    /*
     * 转换为jsonValue
     * 返回 JsonValue - 转换后的JsonValue
     */
    public func toJson(): JsonValue {
        return JsonNull()
    }
}

/* 转换的ArrayList类型别名 */
public type ListJson = ArrayList<Any>
/* 转换的HashMap类型别名 */
public type MapJson = HashMap<String, Any>

public func mapToJson(map: MapJson): JsonValue {
    var mapJson = JsonObject()
    for ((k, v) in map) {
        /* ShiftJson 类型 */
        if (v is ShiftJson) {
            mapJson.put(k, (v as ShiftJson).getOrThrow().toJson())
            continue
        }

        /* JsonValue 类型 */
        if (v is JsonValue) {
            mapJson.put(k, (v as JsonValue).getOrThrow())
            continue
        }

        /* ListJson 类型 */
        if (v is ListJson) {
            mapJson.put(k, listToJson((v as ListJson).getOrThrow()))
            continue
        }

        /* 其他类型的赋值 JsonNull */
        mapJson.put(k, JsonNull())
    }
    return mapJson
}

/*
 * ListJson 转换为json数组
 * 参数 list - 需要转换的ListJson
 * 返回 JsonValue - 转换后的json数组
 */
public func listToJson(list: ListJson): JsonValue {
    var listJson = ArrayList<JsonValue>()
    for (item in list) {
        /* ShiftJson 类型 */
        if (item is ShiftJson) {
            listJson.add((item as ShiftJson).getOrThrow().toJson())
            continue
        }

        /* JsonValue 类型 */
        if (item is JsonValue) {
            listJson.add((item as JsonValue).getOrThrow())
            continue
        }

        /* MapJson 类型 */
        if (item is MapJson) {
            listJson.add(mapToJson((item as MapJson).getOrThrow()))
            continue
        }

        /* 其他类型的赋值 JsonNull */
        listJson.add(JsonNull())
    }
    return JsonArray(listJson)
}
