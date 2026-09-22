class L {
    var content: Array<Int64>
    init(
        content: Array<Int64>,
        isShow!: Bool = true,
        id!: String = "",
        title!: String = "none"
    ) {
        this.content = content
    }
}

main() {
    let l = L([1, 2, 3, 4, 5, 6])
    println("${l.content.size}")
}
