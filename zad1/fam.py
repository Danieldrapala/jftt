

def finite_automation_matcher(text,ctf,m):
    n= len(text)
    q= 0
    
    for i in range(0, n):
        q=ctf[(q,text[i])]
        if q is m:
            s=i-m+1
            print("Pattern found at index: {}".format(s))
            



def CTF(pattern,alphabet):
    m = len(pattern)
    tf = {}
    for q in range(0, m+1):
        for a in alphabet:
            k = min(m + 1, q + 2)
            k -= 1
            while not str(pattern[0:q] + a).endswith(pattern[0:k]):
                k -= 1

            tf[(q, a)] = k
    return tf

# alphabet=["δ","a"]
# txt = "δaδaδaaa"
# pat = "δa"
# x=CTF(pat,alphabet)
# finite_automation_matcher(txt,x,len(pat))

