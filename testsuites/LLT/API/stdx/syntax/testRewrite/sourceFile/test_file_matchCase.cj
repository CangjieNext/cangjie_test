main() {
    match (ty) {
        case a: A =>
            let value = stringBuilder.build(a)
            Info.v = value
            Info.infoMap.add(str, value)
        case _ => { => }
    }
    0
}