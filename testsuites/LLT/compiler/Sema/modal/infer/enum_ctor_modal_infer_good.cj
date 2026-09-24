// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %frontendCompiler %f

enum E<T> {
    | A(T)
    | B
}

// An enum constructor call takes its result mode from the expected type, so the type argument is
// inferred from it even when the expected mode is a concrete @local!.
func single() {
    let v: ?Int64 @local! = Some(1)
    let w: ?Int64 @local? = Some(1)
    let e: E<Int64> @local! = A(1)
    let n: ??Int64 @local! = Some(Some(1))
}

// Same as above, with the type argument inferred from both the argument and the expected type.
exclave func pair<K, V>(k: K @local!, v: V @local!): ?(K, V) @local! {
    Some((k, v))
}

exclave func nested<K, V>(k: K @local!, v: V @local!): ?(K, K) @local! {
    Some((k, k))
}

exclave func userEnum<K>(k: K @local!): E<K> @local! {
    A(k)
}

main() {}
