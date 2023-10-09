//
//  ColorTheme.swift
//  ios_calculator
//
//  Created by Paula Hasstenteufel Denz on 05/10/23.
//

import SwiftUI

enum Theme {
    case cold
    case warm
}

extension Theme {
    enum Cold {
        static let primaryDark = Color(red: 0, green: 0.196, blue: 0.498, opacity: 1)
        static let primaryMedium = Color(red: 0, green: 0.353, blue: 0.686, opacity: 1)
        static let primaryLight = Color(red: 0, green: 0.196, blue: 0.498, opacity: 1)
    }

    enum Warm {
        static let primaryDark = Color(red: 0, green: 0.196, blue: 0.498, opacity: 1)
        static let primaryMedium = Color(red: 0, green: 0.353, blue: 0.686, opacity: 1)
        static let primaryLight = Color(red: 0, green: 0.196, blue: 0.498, opacity: 1)
    }
}

extension Theme {
    enum Neutral {
        static let strongest = Color(red: 0.071, green: 0.071, blue: 0.071, opacity: 1)
        static let strong = Color(red: 0.447, green: 0.463, blue: 0.494, opacity: 1)
        static let medium = Color(red: 0.839, green: 0.843, blue: 0.855, opacity: 1)
        static let soft = Color(red: 0.949, green: 0.949, blue: 0.953, opacity: 1)
        static let softest = Color.white
        
        static let background = Color(red: 0.892, green: 0.892, blue: 0.892, opacity: 1)
    }
    
    enum Feedback {
        static let success = Color(red: 0.039, green: 0.533, blue: 0.329, opacity: 1)
        static let warning = Color(red: 0.792, green: 0.529, blue: 0, opacity: 1)
        static let alert = Color(red: 0.922, green: 0.027, blue: 0.267, opacity: 1)
    }
}



