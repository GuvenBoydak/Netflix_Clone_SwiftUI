//
//  CustomeString.swift
//  Netflix_Clone_SwiftUI
//
//  Created by Güven Boydak on 28.01.2024.
//

import Foundation
import SwiftUI

extension String {
    func locale() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
