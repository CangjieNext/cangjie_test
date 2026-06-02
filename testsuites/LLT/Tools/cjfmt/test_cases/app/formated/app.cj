// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import systemlib.* //test1

// preview test
@preview
main() {
    let entry = Entry()
    let foreach01 = ForEach01()
    let foreach02 = ForEach02()
    let foreach03 = ForEach03()
    let foreach04 = ForEach04()
    let foreach05 = ForEach05()
    let foreach06 = ForEach06()
    let foreach07 = ForEach07()
    let groundoverlaysValue = [MapGroundoverlays(southWest: southWestValue, northEast: northEastValue,
        iconPath: "../Common/logo.png", visible: true, zIndex: 0, opacity: 1, id: 1)]

    // let foreach08 = ForEach08()
    // let foreach09 = ForEach09()
    // let foreach10 = ForEach10()
    App(
        packageName: "com.foreach.demo",
        appName: "foreach test",
        icon: "/common/logo.png",
        pages: [
            entry.configRouter(path: "entry", entryPage: true),
            foreach01.configRouter(path: "foreach01"),
            foreach02.configRouter(path: "foreach02"),
            foreach03.configRouter(path: "foreach03"),
            foreach04.configRouter(path: "foreach04"),
            foreach05.configRouter(path: "foreach05"),
            foreach06.configRouter(path: "foreach06"),
            foreach07.configRouter(path: "foreach07")
            // foreach08.configRouter(path: "foreach08"),
            // foreach09.configRouter(path: "foreach09"),
            // foreach10.configRouter(path: "foreach10")
        ]
    ).run()
}
