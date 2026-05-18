//
//  ChartFilter.swift
//  Melon-iOS
//
//  Created by h2e on 5/19/26.
//

enum ChartFilter: String, CaseIterable {
    case top100 = "TOP100"
    case hot100 = "HOT100"
    case abroad2006 = "ABROAD_2006"
    case sweet = "SWEET"
    
    var displayName: String {
        switch self {
        case .top100: return "TOP100"
        case .hot100: return "HOT100"
        case .abroad2006: return "2006년 해외"
        case .sweet: return "달달한"
        }
    }
}
