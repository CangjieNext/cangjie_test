import std.collection.*
import stdx.syntax.*

main(args: Array<String>): Int64 {
	let filePath = args[0]
    let a = parseFile(filePath).node.getOrThrow()

    for (d in a.topLevelDecls |> filterMap {
        decl: Decl => match (decl) {
            case mainDecl: MainDecl => mainDecl
            case _ => None
        }
    }) {

        d.body.toString() |> println
    }
    return 0
}
