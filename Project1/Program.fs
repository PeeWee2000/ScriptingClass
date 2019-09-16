namespace Program

module Main =
    open System
    open Functions

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
                PrintStatements.PrintHostName()
            elif SelectedOption = "2" then 
                PrintStatements.PrintIP()
            elif SelectedOption = "3" then
                PrintStatements.PrintDNSServers()
            elif SelectedOption = "4" then
                PrintStatements.PrintDefaultGateway()
            elif SelectedOption = "5" then
                PrintStatements.PrintAvailableMemory()
            elif SelectedOption = "6" then
                PrintStatements.PrintPath()
            elif SelectedOption = "7" then
                PrintStatements.PrintDrivers()
            elif SelectedOption = "8" then
                PrintStatements.PrintProcesses()
            elif SelectedOption = "9" then
                printfn "*This must be ran as an admin for this function to work*"
                printfn "Enter a PID: "
                SelectedOption <- Console.ReadLine().ToString()
                let PID = tryToInt(SelectedOption)
                PrintStatements.KillProcess(PID)
            elif SelectedOption = "10" then
                FileInfo.ReadTextFile()
            elif SelectedOption = "11" then
                FileInfo.ReadFileSecurity()
            elif SelectedOption = "12" then
                PrintStatements.PrintActiveConnections()

            ignore(Console.ReadKey())
        0 // return an integer exit code

