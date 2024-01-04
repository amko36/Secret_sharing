A program written in Delphi a lot of years ago.
I put it here just in case. Maybe someone finds it interesting (even if only for educational purposes).
A full description will require a deep dive into mathematical theory. I will limit myself to a general description of the program.

Secret generation program 

In two words, secret generation program generates a secret and keys according to values you put in p.in file.
For example, if you write '10 4' - that means that there should be generated 10 keys for 10 persons and that the main secret may be restored only if at least 4 persons share their keys.
After executing the Project2.exe file, you'll find p.out file in which there will be stored:
 m-keys and a-keys that should be distributed. Each person must have a pair of keys (m,a).
 min(k) number
 max(k-1) number
 Secret value
 
 
Secret recovery program
 
 At first, you should enter the data into secret.in file.
 The first line contains the number of keys;
 the second line : min(k) and max(k-1) values respectively;
 the third line : m keys;
 the fourth line: a keys.
 
 When you've put this information in secret.in file, you can execute Project2.exe and then you'll find the secret value restores in secret.out file.
 