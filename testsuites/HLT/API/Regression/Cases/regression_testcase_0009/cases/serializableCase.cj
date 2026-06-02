/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

internal import stdx.serialization.serialization.DataModel
internal import stdx.encoding.json.{JsonValue, ToJson}

var reps = 5
var nums: Array<Int64> = [8, 64, 128]
var depths: Array<Int64> = [1, 2, 4, 8, 32]

main(): Unit {
    mainSerializableN8D1()
    mainSerializableN8D2()
    mainSerializableN8D4()
    mainSerializableN8D8()
    mainSerializableN8D32()
    mainSerializableN64D1()
    mainSerializableN64D2()
    mainSerializableN64D4()
    mainSerializableN64D8()
    mainSerializableN64D32()
    mainSerializableN128D1()
    mainSerializableN128D2()
    mainSerializableN128D4()
    mainSerializableN128D8()
    mainSerializableN128D32()
    mainDeserializableN8D1()
    mainDeserializableN8D2()
    mainDeserializableN8D4()
    mainDeserializableN8D8()
    mainDeserializableN8D32()
    mainDeserializableN64D1()
    mainDeserializableN64D2()
    mainDeserializableN64D4()
    mainDeserializableN64D8()
    mainDeserializableN64D32()
    mainDeserializableN128D1()
    mainDeserializableN128D2()
    mainDeserializableN128D4()
    mainDeserializableN128D8()
    mainDeserializableN128D32()
}
