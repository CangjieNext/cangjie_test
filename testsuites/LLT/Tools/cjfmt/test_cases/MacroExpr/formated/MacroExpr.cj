// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package foreach07

internal import foreach07.UI.Foundation.*
internal import foreach07.UI.Components.*
internal import foreach07.UI.Systemlib.*
internal import foreach07.UI.Styles.*
internal import foreach07.UI.Common.*
internal import foreach07.UI.App.*
internal import foreach07.UI.Macro.*

public class listState07 <: State {
    var list: Array<MyClass07>
    init(list: Array<MyClass07>) {
        this.list = list
    }
}

public class MyClass07 {
    var myColor: Color
    var myName: String
    var myLength: Px
    var myOpacity: Float64

    init(myColor!: Color, myName!: String, myLength!: Px, myOpacity!: Float64) {
        this.myColor = myColor
        this.myName = myName
        this.myLength = myLength
        this.myOpacity = myOpacity
    }
}

@Comp
public class ForEach07 <: Component {
    let state: listState07 = listState07([])

    override func onInit() {
        let classes: Array<MyClass07> = [
            MyClass07(myColor: Color(Colors.red), myName: "001", myLength: 100.0.px(), myOpacity: 0.0),
            MyClass07(myColor: Color(Colors.yellow), myName: "002", myLength: 200.0.px(), myOpacity: 0.75),
            MyClass07(myColor: Color(255, 255, 224), myName: "003", myLength: Px(300.0), myOpacity: 1.0)
        ]
        let data = classes
        this.state.list = data
    }

    func render() {
        let itemBuilderCb = {
            item: Item<MyClass07>, idx: Int64 => return Div(
                content: [
                    Text(
                        content: bind({=> item.value.myName}),
                        style: Some<TextStyle>(TextStyle(opacity: Some<Float64>(bind({=> item.value.myOpacity}))))
                    )
                ],
                style: Some<DivStyle>(
                    DivStyle(
                        width: Some<Length>(bind({=> item.value.myLength})),
                        height: Some<Length>(100.0.px()),
                        borderWidth: Some<Array<Px>>([1.0.px(), 1.0.px(), 1.0.px(), 1.0.px()]),
                        backgroundColor: Some<Color>(bind({=> item.value.myColor}))
                    )
                )
            )
        }

        Div(content: [@ForEach(<MyClass07>(state.list,itemBuilderCb))])
    }
}
