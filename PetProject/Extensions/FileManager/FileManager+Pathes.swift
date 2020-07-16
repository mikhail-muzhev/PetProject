//
//  FileManager+Pathes.swift
//  PetProject
//
//  Created by Mikhail Muzhev on 16.07.2020.
//  Copyright © 2020 Mikhail Muzhev. All rights reserved.
//

import Foundation

extension FileManager {

    func documentsPath() throws -> URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            else { throw URLError(.badURL) }

        return path
    }
    
    var privateDataPath: String? {
        guard let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first else { return nil }
        if !fileExists(atPath: path) {
            try? createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
        return path
    }
    
    public func createDirectoryForFilepath(_ url: URL) throws {
        let path = url.deletingLastPathComponent().path
        if !fileExists(atPath: path) {
            try createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        }
    }
    
    func urlForPrivateFile(_ relativePath: String) throws -> URL {
        guard let privateDataPath = privateDataPath else { throw AppError.unwrappingError }
        let url = URL(fileURLWithPath: privateDataPath).appendingPathComponent(relativePath)
        try createDirectoryForFilepath(url)
        return url
    }
    
}
