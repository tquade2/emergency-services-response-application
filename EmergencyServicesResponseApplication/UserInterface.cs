using System;

namespace EmergencyServicesResponseApplication
{
    public class UserInterface
    {
        //static string connectionString = "Server=.\\SQLEXPRESS;Database=PetInfo;Trusted_Connection=True;";

        //private IPetDao pets = new PetSqlDao(connectionString);
        //private IOwnerDao owners = new OwnerSqlDao(connectionString);

        public void Run()
        {
            DisplayWelcome();

            bool isDone = false;

            while (!isDone)
            {
                DisplayMenu();

                string userResponse = Console.ReadLine();

                switch (userResponse)
                {
                    //case "1":
                    //    ListEmergencyServiceRequests();
                    //    break;
                    //case "2":
                    //    ListCallers();
                    //    break;
                    //case "3":
                    //    List();
                    //    break;
                    //case "4":
                    //    DeleteAPet();
                    //    break;
                    //case "5":
                    //    ListOwners();
                    //    break;
                    //case "6":
                    //    AddAnOwner();
                    //    break;
                    //case "7":
                    //    UpdateAnOwner();
                    //    break;
                    //case "8":
                    //    DeleteAnOwner();
                    //    break;
                    case "9":
                        isDone = true;
                        break;
                    default:
                        Console.WriteLine("Please enter a valid choice.");
                        break;
                }
            }
        }
        private void DisplayMenu()
        {
            Console.WriteLine();
            Console.WriteLine("Please enter a choice");
            Console.WriteLine("(1) - List pets");
            Console.WriteLine("(2) - Add a pet");
            Console.WriteLine("(3) - Update a pet");
            Console.WriteLine("(4) - Delete a pet");
            Console.WriteLine("(5) - List owners");
            Console.WriteLine("(6) - Add an owner");
            Console.WriteLine("(7) - Update an owner");
            Console.WriteLine("(8) - Delete an owner");
            Console.WriteLine("(9) - To end the program");
        }

        private void DisplayWelcome()
        {
            Console.WriteLine("          _____                    _____                    _____                    _____          \r\n         /\\    \\                  /\\    \\                  /\\    \\                  /\\    \\         \r\n        /::\\    \\                /::\\    \\                /::\\    \\                /::\\    \\        \r\n       /::::\\    \\              /::::\\    \\              /::::\\    \\              /::::\\    \\       \r\n      /::::::\\    \\            /::::::\\    \\            /::::::\\    \\            /::::::\\    \\      \r\n     /:::/\\:::\\    \\          /:::/\\:::\\    \\          /:::/\\:::\\    \\          /:::/\\:::\\    \\     \r\n    /:::/__\\:::\\    \\        /:::/__\\:::\\    \\        /:::/__\\:::\\    \\        /:::/__\\:::\\    \\    \r\n   /::::\\   \\:::\\    \\       \\:::\\   \\:::\\    \\      /::::\\   \\:::\\    \\      /::::\\   \\:::\\    \\   \r\n  /::::::\\   \\:::\\    \\    ___\\:::\\   \\:::\\    \\    /::::::\\   \\:::\\    \\    /::::::\\   \\:::\\    \\  \r\n /:::/\\:::\\   \\:::\\    \\  /\\   \\:::\\   \\:::\\    \\  /:::/\\:::\\   \\:::\\____\\  /:::/\\:::\\   \\:::\\    \\ \r\n/:::/__\\:::\\   \\:::\\____\\/::\\   \\:::\\   \\:::\\____\\/:::/  \\:::\\   \\:::|    |/:::/  \\:::\\   \\:::\\____\\\r\n\\:::\\   \\:::\\   \\::/    /\\:::\\   \\:::\\   \\::/    /\\::/   |::::\\  /:::|____|\\::/    \\:::\\  /:::/    /\r\n \\:::\\   \\:::\\   \\/____/  \\:::\\   \\:::\\   \\/____/  \\/____|:::::\\/:::/    /  \\/____/ \\:::\\/:::/    / \r\n  \\:::\\   \\:::\\    \\       \\:::\\   \\:::\\    \\            |:::::::::/    /            \\::::::/    /  \r\n   \\:::\\   \\:::\\____\\       \\:::\\   \\:::\\____\\           |::|\\::::/    /              \\::::/    /   \r\n    \\:::\\   \\::/    /        \\:::\\  /:::/    /           |::| \\::/____/               /:::/    /    \r\n     \\:::\\   \\/____/          \\:::\\/:::/    /            |::|  ~|                    /:::/    /     \r\n      \\:::\\    \\               \\::::::/    /             |::|   |                   /:::/    /      \r\n       \\:::\\____\\               \\::::/    /              \\::|   |                  /:::/    /       \r\n        \\::/    /                \\::/    /                \\:|   |                  \\::/    /        \r\n         \\/____/                  \\/____/                  \\|___|                   \\/____/         \r\n                                                                                                    ");
        }
    }
}
