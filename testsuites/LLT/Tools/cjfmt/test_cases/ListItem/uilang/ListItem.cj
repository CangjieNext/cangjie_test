// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// package Components

  /**
   * [ListItem] used to present ListItem in List.
   */
internal import Components.systemlib.*

class ListItem <: Component {
    var content: Array<Component>
    var style: ListItemStyle

  /*
     * Sets type of the list-items. A list supports multiple list-item types. The same
     * list-item shall have the same view layout after being rendered. When type is
   * fixed, replace the if attribute with the show attribute to ensure that the view
     * layout remains unchanged.
     */
    var listItemType : String


    init(
        content: Array<Component>,
        style!: ListItemStyle = ListItemStyle(width: 0.px()),
        id!: String = "",
        show!: bool = true,
        languageDir!: LanguageDir = LanguageDir.auto,
        // ListItem
        listItemType!: String = "",
        onClick!: () -> unit = {=>},
        onFocus!: (EventBase) -> unit = {evt: EventBase=>a+b},
        onBlur!: (EventBase) -> unit = {evt: EventBase=>},
        componentId!: String = ""
    ) {
        this.uniqueId = GetUniqueId()
        this.content = content
        this.style = style
        this.id = id
        this.show = show
        this.languageDir = languageDir
        this.click = onClick
        this.focus = onFocus
        this.blur = onBlur
        this.listItemType = listItemType
        this.componentId = componentId
        this.compType = "list-item"
    }


    func GenerateAttr() {
        createObject("attr")
        addProperty(listItemType, "type")
        exitCurrent()
    }

    func GenerateChildren(page: Page) {
        createArray("children")
        for (c in content where c) {
            createObject()
            c.build(page)
            exitCurrent()
        }
        if (x > 0) {
        print("x is larger than 0")
        } else if (x < 0) {
        print("x is lesser than 0")
        } else {
        print("x equals to 0")
        }
        exitCurrent()
    }

    func GenerateShownProperty() {
        //to do: data binding
    }

    func GenerateEvents() {
        createObject("events")
        GenerateGeneralEvents()
        exitCurrent()
    }


    override func build(page: Page) {
        GenerateType()
        GenerateAttr()
        GenerateStyleList()
        GenerateChildren(page)
        GenerateId()
        GenerateComponentId()
        GenerateShownProperty()
        GenerateEvents()
        GenerateStyle(style)
    }
}
