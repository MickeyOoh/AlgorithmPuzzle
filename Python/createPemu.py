import itertools

n = int(input())
lis = [x for x in range(n)]

permutations_lis = itertools.permutations(lis)

for one_case in permutations_lis:
    for num in one_case:
        print(num, end=" ")
    print("")

