✅ **Saída 100% idêntica à especificação.** Todas as 20 linhas batem exatamente.

---

## Comandos para você testar por conta própria

### Compilar e testar o `lex.l` (analisador principal)

```bash
# 1. Gera o lex.yy.c a partir do lex.l
flex lex.l

# 2. Compila o arquivo gerado
gcc lex.yy.c -o a_lex

# 3. Roda com o arquivo de entrada do enunciado
./a_lex < entrada.txt

# 3b. Roda com sua entrada customizada
./a_lex < entrada_custom_lex.txt
```

---

### Compilar e testar o `lex2.l`

```bash
flex lex2.l
gcc lex.yy.c -o a_lex2
./a_lex2 < entrada2.txt
```

---

### Compilar e testar o `lex3.l` (bônus)

```bash
flex lex3.l
gcc lex.yy.c -o a_lex3
./a_lex3 < entrada3.txt
```

---

### Digitar manualmente via teclado (sem arquivo)

```bash
./a_lex
# digite o texto e pressione Ctrl+D para encerrar
```

---

> **Obs.:** O `flex` sempre gera o arquivo com nome fixo `lex.yy.c`, então cada `flex lex?.l` sobrescreve o anterior. Por isso compile com nomes diferentes (`-o a_lex`, `-o a_lex2`, `-o a_lex3`) se quiser ter os três executáveis ao mesmo tempo.