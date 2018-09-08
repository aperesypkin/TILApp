import Vapor
import FluentPostgreSQL

struct MakeCategoriesUnique: Migration {
    typealias Database = PostgreSQLDatabase
    
    static func prepare(on conn: PostgreSQLConnection) -> Future<Void> {
        return Database.update(Category.self, on: conn) { builder in
            builder.unique(on: \.name)
        }
    }
    
    static func revert(on conn: PostgreSQLConnection) -> Future<Void> {
        return Database.update(Category.self, on: conn) { builder in
            builder.deleteUnique(from: \.name)
        }
    }
}
