namespace Program

module Main =
    open System
    open Functions.PrintStatements
    open Functions.FileInfo

    [<EntryPoint>]
    [<STAThread>]
    let main argv = 
    

        while (1 = 1) do 
            Console.CursorVisible <- false
            Console.BackgroundColor <- ConsoleColor.Blue
            Console.ForegroundColor <- ConsoleColor.White
            Console.Clear()

            let Now = DateTime.Now
            printfn "__________Programming Project I__________"
            printfn "__________%A__________" Now
            printfn "\n"


            let Options = [
                "1: Show System Hostname"
                "2: Show System IP Address"
                "3: Show System DNS Servers"
                "4: Show System Default Gateway"
                "5: Show Amount of Memory Available to Run Applications"
                "6: Show PATH enviroment variable"
                "7: List Drivers Installed On System"
                "8: List current running tasks"
                "9: Kill Task"
                "10: Display a text file on the screen"
                "11: Get File Security Information"
                "12: Show All TCP/IP Network Connections and listening Ports"
                "Press Ctrl + C to exit"
            ]


            for option in Options do
                printfn "%s" option
        
    
            let mutable SelectedOption = null
    

            while SelectedOption = null do
                Console.SetCursorPosition(0,1)
                let Now = DateTime.Now
                printfn "__________%A__________" Now

                if Console.KeyAvailable = true then
                    SelectedOption <- Console.ReadKey().KeyChar.ToString()
    
            Console.Clear()


            let tryToInt s = 
                match System.Int32.TryParse s with
                | true, v ->  v
                | false, _ -> 0

            if SelectedOption = "1" then
                PrintHostName()
            elif SelectedOption = "2" then 
                PrintIP()
            elif SelectedOption = "3" then
                PrintDNSServers()
            elif SelectedOption = "4" then
                PrintDefaultGateway()
            elif SelectedOption = "5" then
                PrintAvailableMemory()
            elif SelectedOption = "6" then
                PrintPath()
            elif SelectedOption = "7" then
                PrintDrivers()
            elif SelectedOption = "8" then
                PrintProcesses()
            elif SelectedOption = "9" then
                printfn "*This must be ran as an admin for this function to work*"
                printfn "Enter a PID: "
                SelectedOption <- Console.ReadLine().ToString()
                let PID = tryToInt(SelectedOption)
                KillProcess(PID)
            elif SelectedOption = "10" then
                ReadTextFile()
            elif SelectedOption = "11" then
                ReadFileSecurity()
            elif SelectedOption = "12" then
                PrintActiveConnections()

            ignore(Console.ReadKey())
        0 // return an integer exit code

