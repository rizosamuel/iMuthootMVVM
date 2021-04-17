//
//  NetworkManager.swift
//  Trails
//
//  Created by Rijo Samuel on 14/04/21.
//

import Foundation
import Network

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let monitor: NWPathMonitor
    private let queue: DispatchQueue
    
    private(set) var isConnected: Bool = false
    private(set) var connectionType: ConnectionType = .unknown
    
    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    private init() {
        monitor = NWPathMonitor()
        queue = DispatchQueue.global()
    }

    public func startMonitoring() {
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isConnected = path.status == .satisfied ? true : false
            self?.getConnectionType(path)
        }
        
        print("Network Monitoring started")
    }
    
    public func stopMonitoring() {
        monitor.cancel()
        print("Network Monitoring stopped")
    }
    
    private func getConnectionType(_ path: NWPath) {
        if path.usesInterfaceType(.wifi) { connectionType = .wifi }
        else if path.usesInterfaceType(.cellular) { connectionType = .cellular }
        else if path.usesInterfaceType(.wiredEthernet) { connectionType = .ethernet }
        else { connectionType = .unknown }
    }
}
