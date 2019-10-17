def kmpMatcher(txt,pattern):
    n=len(txt)
    m=len(pattern)
    pi=computeprefixfunction(pattern)
    q=0
    i=0
    while i < n: 
        if pattern[q] == txt[i]: 
            i += 1
            q += 1
        if q == m: 
            print ("Found pattern at index " + str(i-q))
            q = pi[q-1] 
  
        elif i < n and pattern[q] != txt[i]: 
            if q != 0: 
                q = pi[q-1] 
            else: 
                i += 1
  
def computeprefixfunction(pattern):
    m= len(pattern)
    pi=[0]*m
    pi[0]=0
    k=0

    q=1
    while q < m: 
        if pattern[q]== pattern[k]: 
            k += 1
            pi[q] = k
            q += 1
        else: 
            if k != 0: 
                k = pi[k-1] 
            else: 
                pi[q] = 0
                q += 1
    return pi

# txt = "ΞΔΞΔ~ΔΞΔΞΔΞΔ~"
# pat = "ΞΔΞΔΞΔ"
# kmpMatcher(txt,pat)