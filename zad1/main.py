import fam
import kmp
import sys
import time


def check_input(alphabet,txt):
    for ch in txt:
        if ch not in alphabet:
            print('Character', ch, 'from input is not in alphabet!')
            exit(1)

def main():
    n = int(input('n: '))
    alphabet = set()

    for i in range(0, n):
        ch =input("{}: ".format(i))[0] 
        alphabet.add(ch)

    print(alphabet)

    text = str(input('text: '))
    check_input(alphabet, text)
    pattcount=int(input('how many patterns do you want to check: '))
    for s in range(0,pattcount):
        pattern = str(input('pattern: '))
        check_input(alphabet, pattern)
        print(pattern)
        print("Matching pattern with FA")
        start1=time.time()
        ctf = fam.CTF(pattern, alphabet)
        fam.finite_automation_matcher(text, ctf, len(pattern))
        print("FA time:" +str((time.time()-start1)) )
        
        print("Matching pattern with KMP algorithm")
        start2=time.time()
        kmp.kmpMatcher(text,pattern)
        print("kmp time:" +str((time.time()-start2)) )

if __name__ == "__main__":
    main()