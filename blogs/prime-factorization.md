---
title: "素因数分解プログラム"
date: "2022-09-04 13:00:00"
category: "Blog"
hero: /assets/images/note.jpg
tags: ["python", "java", "c"]
math: true
layout: blog
excerpt: 素因数分解を様々なプログラミング言語で実装しました
---

個別塾のバイト中に素因数分解を教えていて、  
「素因数分解は繰り返しのためコンピュータが処理を得意そう」  
と感じたためプログラムを実装してみました

## python
まずはpythonです

PrimeFactorization.py
```python
def PrimeFactorization(num):
    factors = []
    i = 2
    while(i != num):
        if num % i == 0:
            factors.append(i)
            num = int( num / i )
            i = 2
        else:
            i += 1
    factors.append(num)
    return factors

num = int(input("素因数分解したい整数を入力してください："))
factors_result = PrimeFactorization(num)
print(factors_result)
```

実行
```console
$ python3 PrimeFactorization.py
素因数分解したい整数を入力してください：1024
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
```

1024を素因数分解することができました

## java
続いて、同じ内容をjavaでやってみました

PrimeFactorization.java
```java
import java.util.Scanner;
import java.util.ArrayList;

class PrimeFactorization{
  public static void main(String args[]) {
    Scanner scanner = new Scanner(System.in);
    System.out.print("素因数分解したい整数を入力してください：");

    int input = scanner.nextInt();

    System.out.println(calc(input));
    scanner.close();
  }

  private static ArrayList<Integer> calc(int num) {
    ArrayList<Integer> factors = new ArrayList<>();
    int i = 2;
    
    while (i != num) {
      if (num % i == 0) {
        factors.add(i);
        num /= i;
        i = 2;
      } else {
        i += 1;
      }
    }
    factors.add(num);
    return factors;
  }
}
```

出力
```console
$ javac PrimeFactorization.java
$ java PrimeFactorization
素因数分解したい整数を入力してください：1024
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
```
先にコンパイルするの懐かしいです  
変数や配列や関数の型の指定の不要なpythonって楽な言語だと改めて実感しました

## C
c言語でもやってみました

PrimeFactorization.c
```c
#include <stdio.h>

void PrimeFactorization(num)
{
  int i = 2;
  printf("[");
  while (i != num)
  {
    if (num % i == 0)
    {
      printf("%d, ", i);
      num /= i;
      i = 2;
    }
    else
    {
      i++;
    }
  }
  printf("%d]\n", num);
}

int main()
{
  int num;
  printf("素因数分解したい整数を入力してください：");
  scanf("%d", &num);
  PrimeFactorization(num);
}
```

実行
```console
$ gcc PrimeFactorization.c -o app   
$ ./app
素因数分解したい整数を入力してください：1024
[2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
```

c言語での可変配列がよくわからなかったので、因数を順番にprintfで出力するようにしました  
printfですら型の指定が必要なCは大変ですね...  
実行は速いですが...（この程度のプログラムじゃ差はない）