using System.Runtime.CompilerServices;
using ClassLibraryModel;
using ClassLibraryDAL;

namespace JobProcessingSystem.Authentication
{
    public class UserAccountService
    {
        private List<UserModel> usrData { get; set; } = new List<UserModel>();
        private List<UserAccount> users = new List<UserAccount>();

        private void LoadUser()
        {
            usrData = UserDAL.GetUser();
        }

        public UserAccountService()
        {
            LoadUser();
            foreach (var item in usrData)
            {
                var newUser = new UserAccount { userName = item.userName, password = item.password, DeptName = item.DeptName };
                users.Add(newUser);
            }
        }

        public UserAccount? GetByUserEmail(string UserName)
        {
            return users.FirstOrDefault(x => x.userName == UserName);
        }
    }
}
