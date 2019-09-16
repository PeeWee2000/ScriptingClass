namespace Functions

open System
open System.Net
open System.Net.NetworkInformation
open System.Windows.Forms
open Microsoft.VisualBasic.Devices
open System.Management
open System.Diagnostics
open System.IO
open System.Net.NetworkInformation
open System.Security.AccessControl


module PrintStatements = 
    let PrintHostName () = 
        let HostName = Environment.MachineName
        printfn "The system hostname is: %A" HostName
    
    let PrintIP() = 
        let Host = Dns.GetHostEntry(Dns.GetHostName())
        let IPs = Host.AddressList
        for i in IPs do
            if i.AddressFamily = System.Net.Sockets.AddressFamily.InterNetwork then
                let IPString = i.ToString()
                printfn "The IP address of the system is %s" IPString      


    let PrintDNSServers() = 
        let DNSServers = NetworkInterface.GetAllNetworkInterfaces()

        for i in DNSServers do
            let DatBoi = i.GetIPProperties()
            printfn "%A" DatBoi.DnsAddresses

    let PrintDefaultGateway () = 
        let adapters  = NetworkInterface.GetAllNetworkInterfaces()

        for adapter in adapters do
            let adapterProperties = adapter.GetIPProperties()
            let addresses = adapterProperties.GatewayAddresses

            if addresses.Count > 0 then
                for address in addresses do
                    let AddressString = address.Address.ToString()
                    printfn "%A"  AddressString

    let PrintAvailableMemory() = 
        let AvailableMemory = int(ComputerInfo().AvailableVirtualMemory)
        let AvailableInKB = AvailableMemory / 1024
        let AvailableInMB = AvailableInKB / 1024
        let AVailableInGB = AvailableInMB / 1024
        printfn "Free Memory: %AMB" AVailableInGB
    

    let PrintPath() = 
        let Path = Environment.CurrentDirectory
        printfn "Current path: %s" Path

    let  PrintDrivers() = 
        let WMIObjects = new ManagementObjectSearcher("SELECT * FROM Win32_PnPSignedDriver")
        for wMIObject in WMIObjects.Get() do
        
            try
                let Device = wMIObject.GetPropertyValue("DeviceName").ToString()
                printfn "Driver found for: %s" Device
            with
            | _ -> printfn ""

    let  PrintProcesses () = 
        let localAll = Process.GetProcesses()
        for _process in localAll do
            printfn "Process: %A    Id: %A" _process.ProcessName _process.Id
            
    let KillProcess (x) = 
        let localAll = Process.GetProcesses()
        for datboi in localAll do
            let Id = datboi.Id
            try 
                if Id = x then
                    datboi.Kill()
                printfn "Process succesfully stopped"
            with
            | _ -> printfn "Failed to kill process"


    let  PrintActiveConnections () = 
        let properties = IPGlobalProperties.GetIPGlobalProperties()
        let connections = properties.GetActiveTcpConnections()
        for connection in connections do
            printfn "%s" (connection.LocalEndPoint.ToString() + " <-----> " + connection.RemoteEndPoint.ToString())

module FileInfo = 
    let ReadTextFile () = 
        //Read a text file
        let dialog = new OpenFileDialog()
        ignore(dialog.ShowDialog())
        let file = dialog.FileName
        let filetext =  File.ReadAllText(file)
        printfn "%s" filetext
    
    let  ReadFileSecurity () = 
        //Read the security of a file
        let dialog = new OpenFileDialog()
        ignore(dialog.ShowDialog())
        let file = dialog.FileName
        let filesecurity =  File.GetAccessControl(file)
        printfn "%A" filesecurity
    
    
