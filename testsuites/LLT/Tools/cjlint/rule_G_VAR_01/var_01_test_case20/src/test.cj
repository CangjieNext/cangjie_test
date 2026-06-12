// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

struct GameState {
    var chapter: String
    var weapon: String
    init(chapter!: String = "", weapon!: String = "") {
        this.chapter = chapter
        this.weapon = weapon
    }
}
main() {
    var gameState = GameState(chapter: "Black Mesa Inbound", weapon: "Crowbar")
    gameState.chapter = "Anomalous Materials"
    gameState.weapon = "Glock 17"
}
