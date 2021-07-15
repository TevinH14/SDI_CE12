using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hamilton_Tevin_StringObjects
{
    class Program
    {
        static void Main(string[] args)
        {
            /* Tevin Hamilton
           * 03/16/2018
           * String Objects 
           * */

            //Problem 1
            //promt the user for the phone number 
            Console.Clear();
            Console.WriteLine("Welcome to the Program please enter a 10 deight phone numeber (xxx)xxx-xxxx.\r\n\r\nPlease enter your phone number like the example above.");
            string userNumberString = Console.ReadLine();
            int userNumber;
            while (!(int.TryParse(userNumberString, out userNumber)|| (userNumberString.Length == 14)))
            {
                Console.WriteLine("\r\nthe phone number you have enter is invalid");
                Console.WriteLine("\r\nplease enter a 10 deight phone numeber (xxx)xxx-xxxx.\r\n\r\nPlease enter your phone number like the example above.");
                userNumberString = Console.ReadLine();
            }
            string validOrNotValid = PhoneValidation(userNumberString);
            Console.WriteLine(validOrNotValid);
            /*TEST TEST TEST
             * test 1 ( (123) 456-7890 - valid)
             * test 2 (-(123 456-7890)
             * test 3 ( 123-456-7890)
             * test 4 (1234567890)
             * test 5 (617 835 9836)
             * */


            //Problem 2 
            Console.WriteLine("\r\nplease send a encrypted messege\r\n@=a\r\n#=e\r\n^=i\r\n*=0\r\n+=u\r\n");
            string userEncrypted = Console.ReadLine();
            while (string.IsNullOrWhiteSpace(userEncrypted))
            {
                Console.WriteLine("please don't leave blank\r\n");
                Console.WriteLine("\r\nplease send a encrypted messege\r\n@=a\r\n#=e\r\n^=i\r\n*=0\r\n+=u\r\n");
                userEncrypted = Console.ReadLine();
            }
            string userNewMessage = WhatIsTheHidedMessege(userEncrypted);
            Console.WriteLine(userNewMessage);
            /*test test test 
             * test1(Str^ng *bj#cts c@n b# f+n t* w*rk w^th = String objects can be fun to work with)
             * test2(D#b+gg^ng ^s th# pr*c#ss *f r#m*v^ng s*ftw@r# b+gs, th#n pr*gr@mm^ng m+st b# th# pr*c#ss *f p+tt^ng th#m ^n = Debugging is the process of removing software bugs, then programming must be the process of putting them in)
             * test3(H^ n#w +s#r ^ @m y*+r n#w fr^#nd = Hi new user i am your new friend)
             * */


        }

        public static string PhoneValidation (string phone)
         {
            if (phone.IndexOf('(') != 0 || (phone.IndexOf(')') != 4) || (phone.IndexOf(' ') != 5) || (phone.IndexOf('-') != 9))
            {
                string isNotVald = ("your phone number is not valid ");
                return isNotVald;
            }
            else
            {

                string isValid = ("your phone number is valid");
                return isValid;

            }
            
            
         }
        public static string WhatIsTheHidedMessege(string message)
        {
            char[] userCharArray = message.ToCharArray();
            for (int i = 0; i < userCharArray.Length; i++)
            {
                if (userCharArray[i] == '@')
                {
                    userCharArray[i] = 'a';
                }
                else if (userCharArray[i] == '#')
                {
                    userCharArray[i] = 'e';
                }
                else if (userCharArray[i] == '^')
                {
                    userCharArray[i] = 'i';
                }
                else if (userCharArray[i] == '*')
                {
                    userCharArray[i] = 'o';
                }
                else if (userCharArray[i] == '+')
                {
                    userCharArray[i] = 'u';
                }
                
            }
            string newUserString = new string(userCharArray);
            return newUserString;
        }
        

     }
}
