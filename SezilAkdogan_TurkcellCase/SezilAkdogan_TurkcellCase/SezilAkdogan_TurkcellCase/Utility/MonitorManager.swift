//
//  MonitorManager.swift
//  SezilAkdogan_TurkcellCase
//
//  Created by Sezil Akdoğan on 11.07.2023.
//

import Network

final class MonitorManager {
   
    static let shared: MonitorManager = MonitorManager()
    
    private let monitor: NWPathMonitor = NWPathMonitor()
    private var status: NWPath.Status = .satisfied
    var isReachable: Bool { status == .satisfied }
    
    private init() { }
}

extension MonitorManager {
    func startMonitoring() {
        monitor.pathUpdateHandler = {[weak self] monitorPath in
            guard let self = self else { return }
            
            self.status = monitorPath.status
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func cancel() {
        monitor.cancel()
    }
}
