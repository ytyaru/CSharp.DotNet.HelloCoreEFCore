using System;

namespace HelloCoreEFCore
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World! and EFCore.");
            using (var db = new AppDbContext()) {
                var account = new Accounts() { Id=0, GitHubId=0, Username="user1", Password="pass1" };
                db.Accounts.Add(account);
                db.SaveChanges();
                Console.WriteLine(account);
            }
        }
    }
}
