// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

/*test1*/let/*test2*/ a="test"/*test3*/
/*test4*/let/*test5*/ b="comments"/*test6*/

main() {
App(
  /*test7*/packageName: "com.foreach.demo",/*test7*/
  /*test8*/appName: /*test8*/"foreach test",/*test8*/
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