//
//  RealmStorage.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 16.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import Foundation
import RealmSwift

typealias RxRealmUpdatedPolicy = Realm.UpdatePolicy

enum RealmStorageVersion: UInt64 {
    case v1 = 1
}

class RealmStorage {
    
    var realm: Realm {
        guard let realm = try? Realm(configuration: _realmConfiguration) else { fatalError() }
        return realm
    }
    
    private static let _queue = DispatchQueue(label: "RealmStorage.queue", attributes: .concurrent)
    private static var _storages = [String: RealmStorage]()

    private let _realmConfiguration: Realm.Configuration

    init (_ configuration: Realm.Configuration) {
        _realmConfiguration = configuration
    }

    static func storage(key: String, orCreate: @escaping ((String) -> RealmStorage)) -> RealmStorage {
        var storage: RealmStorage?
        _queue.sync {
            if let value = _storages[key] {
                storage = value
            } else {
                let value = orCreate(key)
                _storages[key] = value
                storage = value
            }
        }
        return storage!
    }

    static func storage(key: String) -> RealmStorage? {
        var storage: RealmStorage?
        _queue.sync {
            storage = _storages[key]
        }
        return storage
    }

    static func removeStorage(key: String) {
        _queue.async {
            _storages.removeValue(forKey: key)
        }
    }
    
    func save<T: Object>(_ objects: T..., updatePolicy: Realm.UpdatePolicy, onFailure: ((Error) -> Void)? = nil) {
        do {
            try realm.safeWrite {
                realm.add(objects, update: updatePolicy)
            }
        } catch {
            onFailure?(error)
        }
    }

    func save<T: Sequence>(_ objects: T, updatePolicy: Realm.UpdatePolicy, onFailure: ((Error) -> Void)? = nil) where T.Iterator.Element: Object {
        do {
            try realm.safeWrite {
                realm.add(objects, update: updatePolicy)
            }
        } catch {
            onFailure?(error)
        }
    }

    func delete<T: Object>(_ objects: T..., onFailure: ((Error) -> Void)? = nil) {
        do {
            try realm.safeWrite {
                realm.delete(objects)
            }
        } catch {
            onFailure?(error)
        }
    }

    func delete<T: Sequence>(_ objects: T, onFailure: ((Error) -> Void)? = nil) where T.Iterator.Element: Object {
        do {
            try realm.safeWrite {
                realm.delete(objects)
            }
        } catch {
            onFailure?(error)
        }
    }
}

extension RealmStorage {

    static var common: RealmStorage {
        return RealmStorage.storage(key: "default") { key in
            var configuration = Realm.Configuration.defaultConfiguration
            configuration.fileURL = try? FileManager.default.urlForPrivateFile(key + ".realm")
            configuration.schemaVersion = RealmStorageVersion.v1.rawValue
            configuration.migrationBlock = commonDbMigration
            let storage = RealmStorage(configuration)
            Logger.log(type: .debug, message: "DB \(key).realm \(configuration.fileURL?.absoluteString ?? "don't created")")
            return storage
        }
    }

    private static func commonDbMigration(_ migration: Migration, _ oldSchemaVersion: UInt64) {

    }

}

extension Realm {
    public func safeWrite(_ block: (() throws -> Void)) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
