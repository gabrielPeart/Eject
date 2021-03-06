//
//  NilBuilder.swift
//  Eject
//
//  Created by Brian King on 10/19/16.
//  Copyright © 2016 Brian King. All rights reserved.
//

import Foundation


struct KeyValueBuilder: Builder, CharacterBuilder {
    let value: BasicValue

    init(value: String = "", format: ValueFormat = .raw) {
        self.value = BasicValue(value: value, format: format)
    }

    func buildElement(attributes: inout [String: String], document: XIBDocument, parent: Reference?) throws -> Reference? {
        if let parent = parent {
            let key = try attributes.removeRequiredValue(forKey: "key")
            value.value = attributes.removeValue(forKey: "value") ?? value.value
            document.addVariableConfiguration(for: parent.identifier, key: key, value: value)
        }
        return parent
    }

    func found(characters: String) {
        value.value.append(characters)
    }

}
