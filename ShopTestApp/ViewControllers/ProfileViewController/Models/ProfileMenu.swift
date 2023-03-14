//
//  ProfileMenu.swift
//  ShopTestApp
//
//  Created by Eugene Kudritsky on 14.03.23.
//

import UIKit

enum ProfileMenu {
  case tradeStore
  case paymentMethod
  case balance
  case tradeHistory
  case restorePurchase
  case help
  case logOut

  var title: String {
    switch self {
    case .tradeStore: return "Trade Store"
    case .paymentMethod: return "Payment Method"
    case .balance: return "Balance"
    case .tradeHistory: return "Trade History"
    case .restorePurchase: return "Restore Purchase"
    case .help: return "Help"
    case .logOut: return "Log Out"
    }
  }

  var balanceCount: String? {
    switch self {
    case .balance: return "$1593"
    default: return nil
    }
  }

  var enclosure: Bool {
    switch self {
    case .tradeStore: return true
    case .paymentMethod: return true
    case .tradeHistory: return true
    case .restorePurchase: return true
    default: return false
    }
  }

  var image: UIImage? {
    switch self {
    case .tradeStore: return UIImage(named: "cardIcon")
    case .paymentMethod: return UIImage(named: "cardIcon")
    case .balance: return UIImage(named: "cardIcon")
    case .tradeHistory: return UIImage(named: "cardIcon")
    case .restorePurchase: return UIImage(named: "restorePurchaseIcon")
    case .help: return UIImage(named: "helpIcon")
    case .logOut: return UIImage(named: "logOutIcon")
    }
  }
}


