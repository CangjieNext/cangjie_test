/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.fs.File
import stdx.encoding.json.*

public func assertDiagnosis(compilationResult: String, at!: Int64, kind!: ?String = None, message!: ?String = None,
    note!: ?String = None): Unit {
    if (let Some(k) <- kind) {
        let actualKind = JsonValue
            .fromStr(compilationResult)
            .asObject()
            .get("Diags")
            .getOrThrow()
            .asArray()
            .get(at)
            .getOrThrow()
            .asObject()
            .get("DiagKind")
            .getOrThrow()
            .asString()
            .getValue()
        if (actualKind != k) {
            throw Exception("Wrong diagnosis kind.\nExpecting \"${k}\".\nActual message is \"${actualKind}\".")
        }
    }
    if (let Some(m) <- message) {
        let actualMessage = JsonValue
            .fromStr(compilationResult)
            .asObject()
            .get("Diags")
            .getOrThrow()
            .asArray()
            .get(at)
            .getOrThrow()
            .asObject()
            .get("Message")
            .getOrThrow()
            .asString()
            .getValue()
        if (actualMessage != m) {
            throw Exception("Wrong diagnosis message.\nExpecting \"${m}\".\nActual message is \"${actualMessage}\".")
        }
    }
    if (let Some(n) <- note) {
        let actualNote = JsonValue
            .fromStr(compilationResult)
            .asObject()
            .get("Diags")
            .getOrThrow()
            .asArray()
            .get(at)
            .getOrThrow()
            .asObject()
            .get("Notes")
            .getOrThrow()
            .asArray()
            .get(0)
            .getOrThrow()
            .asObject()
            .get("Message")
            .getOrThrow()
            .asString()
            .getValue()
        if (actualNote != n) {
            throw Exception("Wrong diagnosis note.\nExpecting \"${n}\".\nActual message is \"${actualNote}\".")
        }
    }
}
